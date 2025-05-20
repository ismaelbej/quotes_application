import 'package:multiple_result/multiple_result.dart';

import 'package:quotes_application/data/datasources/quotes_datasource.dart';
import 'package:quotes_application/domain/entities/quote.dart';
import 'package:quotes_application/domain/repositories/quotes_repository.dart';

class QuotesRepositoryImpl implements QuotesRepository {
  final QuotesDataSource quotesDataSource;

  QuotesRepositoryImpl({required this.quotesDataSource});

  @override
  Future<Result<Quote, Exception>> getQuote() async {
    final result = await quotesDataSource.getQuote();
    return result.mapSuccess((quoteModel) => quoteModel.toQuote());
  }
}
