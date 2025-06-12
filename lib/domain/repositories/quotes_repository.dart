import 'package:multiple_result/multiple_result.dart';

import 'package:quotes_application/domain/entities/quote.dart';

abstract class QuotesRepository {
  Future<Result<Quote, Exception>> getRandomQuote();
  Future<Result<Quote, Exception>> getQuoteBy(String author);
}
