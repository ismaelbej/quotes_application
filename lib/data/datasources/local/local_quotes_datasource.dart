import 'dart:math';

import 'package:quotes_application/core/errors/no_quote.dart';
import 'package:quotes_application/data/datasources/quotes_datasource.dart';
import 'package:quotes_application/data/models/quote_model.dart';
import 'package:multiple_result/multiple_result.dart';

class LocalQuotesDataSource implements QuotesDataSource {
  static final quotes =
      [
        ["To be or not to be", "W. Shakespeare"],
        ["Ladran, Sancho, señal que cabalgamos", "Don Quijote"],
      ].map((arr) => QuoteModel(text: arr[0], author: arr[1])).toList();

  @override
  Future<Result<QuoteModel, Exception>> getRandomQuote() async {
    final index = Random().nextInt(quotes.length);
    return Success(quotes[index]);
  }

  @override
  Future<Result<QuoteModel, Exception>> getQuoteBy(String author) async {
    try {
      final quote = quotes.firstWhere((model) => model.author == author);
      return Success(quote);
    } catch (_) {
      return Error(NoQuote());
    }
  }
}
