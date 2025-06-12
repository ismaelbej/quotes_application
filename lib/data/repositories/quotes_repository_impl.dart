import 'package:multiple_result/multiple_result.dart';

import 'package:quotes_application/data/datasources/quotes_datasource.dart';
import 'package:quotes_application/domain/entities/quote.dart';
import 'package:quotes_application/domain/repositories/quotes_repository.dart';

class QuotesRepositoryImpl implements QuotesRepository {
  final QuotesDataSource quotesDataSource;

  QuotesRepositoryImpl({required this.quotesDataSource});

  @override
  Future<Result<Quote, Exception>> getRandomQuote() async {
    final result = await quotesDataSource.getRandomQuote();
    return result.mapSuccess((quoteModel) => quoteModel.toQuote());
  }

  @override
  Future<Result<Quote, Exception>> getQuoteBy(String author) async {
    final result = await quotesDataSource.getQuoteBy(author);
    return result.mapSuccess((quoteModel) => quoteModel.toQuote());
  }
}
