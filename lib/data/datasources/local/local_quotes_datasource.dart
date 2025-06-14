import 'dart:math';

import 'package:quotes_application/core/errors/no_quote.dart';
import 'package:quotes_application/data/datasources/quotes_datasource.dart';
import 'package:quotes_application/data/models/quote_model.dart';
import 'package:multiple_result/multiple_result.dart';

class LocalQuotesDataSource implements QuotesDataSource {
  static final _quotes = [
    QuoteModel(text: "To be or not to be", author: "W. Shakespeare"),
    QuoteModel(
      text: "Ladran, Sancho, señal que cabalgamos",
      author: "Don Quijote",
    ),
  ];

  @override
  Future<Result<QuoteModel, Exception>> getRandomQuote() async {
    final index = Random().nextInt(_quotes.length);
    return Success(_quotes[index]);
  }

  @override
  Future<Result<QuoteModel, Exception>> getQuoteBy(String author) async {
    try {
      final quote = _quotes.firstWhere((model) => model.author == author);
      return Success(quote);
    } catch (_) {
      return Error(NoQuote());
    }
  }
}
