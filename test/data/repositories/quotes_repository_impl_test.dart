import 'package:quotes_application/core/errors/unknown_error.dart';
import 'package:quotes_application/data/datasources/quotes_datasource.dart';
import 'package:quotes_application/data/models/quote_model.dart';
import 'package:quotes_application/data/repositories/quotes_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

class MockQuotesDataSource extends Mock implements QuotesDataSource {}

void main() {
  group("QuotesRepositoryImpl", () {
    late QuotesDataSource quotesDataSource;
    late QuotesRepositoryImpl quotesRepository;

    final quoteModel = QuoteModel(
      text: "To be or not to be",
      author: "W. Shakespeare",
    );
    final quote = quoteModel.toQuote();

    setUp(() {
      quotesDataSource = MockQuotesDataSource();
      quotesRepository = QuotesRepositoryImpl(
        quotesDataSource: quotesDataSource,
      );
    });

    test("should return a random quote from data source", () async {
      when(
        () => quotesDataSource.getRandomQuote(),
      ).thenAnswer((_) => Future.value(Success(quoteModel)));

      final result = await quotesRepository.getRandomQuote();

      expect(result, Success(quote));
      verify(() => quotesDataSource.getRandomQuote()).called(1);
    });

    test("should return an error from data source", () async {
      when(
        () => quotesDataSource.getRandomQuote(),
      ).thenAnswer((_) => Future.value(Error(UnknownError())));

      final result = await quotesRepository.getRandomQuote();

      expect(result, Error(UnknownError()));
      verify(() => quotesDataSource.getRandomQuote()).called(1);
    });
  });
}
