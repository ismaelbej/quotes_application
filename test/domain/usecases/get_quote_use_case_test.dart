import 'package:quotes_application/core/errors/unknown_error.dart';
import 'package:quotes_application/domain/entities/quote.dart';
import 'package:quotes_application/domain/repositories/quotes_repository.dart';
import 'package:quotes_application/domain/usecases/get_quote_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

class MockQuotesRepository extends Mock implements QuotesRepository {}

void main() {
  group("GetQuoteUseCase", () {
    late QuotesRepository quotesRepository = MockQuotesRepository();

    late GetQuoteUseCase getQuoteUseCase = GetQuoteUseCase(
      quotesRepository: quotesRepository,
    );

    final quote = Quote(text: "To be or not to be", author: "W. Shakespeare");

    setUp(() {
      quotesRepository = MockQuotesRepository();

      getQuoteUseCase = GetQuoteUseCase(quotesRepository: quotesRepository);
    });

    test("should return quote from repository", () async {
      when(
        () => quotesRepository.getQuote(),
      ).thenAnswer((_) => Future.value(Success(quote)));

      final result = await getQuoteUseCase();

      expect(result, Success(quote));
      verify(() => quotesRepository.getQuote()).called(1);
    });

    test("should return error from repository", () async {
      when(
        () => quotesRepository.getQuote(),
      ).thenAnswer((_) => Future.value(Error(UnknownError())));

      final result = await getQuoteUseCase();

      expect(result, Error(UnknownError()));
      verify(() => quotesRepository.getQuote()).called(1);
    });
  });
}
