import 'package:quotes_application/core/errors/unknown_error.dart';
import 'package:quotes_application/domain/entities/quote.dart';
import 'package:quotes_application/domain/repositories/quotes_repository.dart';
import 'package:quotes_application/domain/usecases/get_random_quote_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

class MockQuotesRepository extends Mock implements QuotesRepository {}

void main() {
  group("GetRandomQuoteUseCase", () {
    late QuotesRepository quotesRepository = MockQuotesRepository();

    late GetRandomQuoteUseCase getRandomQuoteUseCase = GetRandomQuoteUseCase(
      quotesRepository: quotesRepository,
    );

    final quote = Quote(text: "To be or not to be", author: "W. Shakespeare");

    setUp(() {
      quotesRepository = MockQuotesRepository();

      getRandomQuoteUseCase = GetRandomQuoteUseCase(
        quotesRepository: quotesRepository,
      );
    });

    test("should return quote from repository", () async {
      when(
        () => quotesRepository.getRandomQuote(),
      ).thenAnswer((_) => Future.value(Success(quote)));

      final result = await getRandomQuoteUseCase();

      expect(result, Success(quote));
      verify(() => quotesRepository.getRandomQuote()).called(1);
    });

    test("should return error from repository", () async {
      when(
        () => quotesRepository.getRandomQuote(),
      ).thenAnswer((_) => Future.value(Error(UnknownError())));

      final result = await getRandomQuoteUseCase();

      expect(result, Error(UnknownError()));
      verify(() => quotesRepository.getRandomQuote()).called(1);
    });
  });
}
