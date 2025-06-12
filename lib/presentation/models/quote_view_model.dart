import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quotes_application/domain/entities/quote.dart';
import 'package:quotes_application/domain/usecases/get_random_quote_use_case.dart';

part 'quote_view_model_state.dart';

class QuoteViewModel extends ChangeNotifier {
  final GetRandomQuoteUseCase getQuoteUseCase;

  late QuoteViewModelState _state;

  QuoteViewModelState get state => _state;

  QuoteViewModel({required this.getQuoteUseCase})
    : _state = QuoteViewModelState.loading;

  Future loadQuote() async {
    _state = QuoteViewModelState.loading;
    notifyListeners();

    final result = await getQuoteUseCase();

    result.map(
      successMapper: (quote) {
        _state = QuoteViewModelState.loadedQuote(quote: quote);
      },
      errorMapper: (error) {
        _state = QuoteViewModelState.error(error: error);
      },
    );
    notifyListeners();
  }
}
