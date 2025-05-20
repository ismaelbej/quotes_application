import 'package:quotes_application/data/datasources/quotes_datasource.dart';
import 'package:quotes_application/data/models/quote_model.dart';
import 'package:multiple_result/src/result.dart';

class LocalQuotesDataSource implements QuotesDataSource {
  @override
  Future<Result<QuoteModel, Exception>> getQuote() {
    // TODO: implement getQuote
    throw UnimplementedError();
  }
}
