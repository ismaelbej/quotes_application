import 'package:multiple_result/multiple_result.dart';

import 'package:quotes_application/data/models/quote_model.dart';

abstract class QuotesDataSource {
  Future<Result<QuoteModel, Exception>> getRandomQuote();
  Future<Result<QuoteModel, Exception>> getQuoteBy(String author);
}
