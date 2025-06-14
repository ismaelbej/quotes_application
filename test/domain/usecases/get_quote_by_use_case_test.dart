import 'package:quotes_application/core/errors/no_quote.dart';
import 'package:quotes_application/domain/entities/quote.dart';
import 'package:quotes_application/domain/repositories/quotes_repository.dart';
import 'package:quotes_application/domain/usecases/get_quote_by_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

class MockQuotesRepository extends Mock implements QuotesRepository {}

void main() {
  group("GetQuoteByUseCase", () {
    late QuotesRepository quotesRepository;

    late GetQuoteByUseCase getQuoteByUseCase;

    final quote = Quote(text: "To be or not to be", author: "W. Shakespeare");

    setUp(() {
      quotesRepository = MockQuotesRepository();

      getQuoteByUseCase = GetQuoteByUseCase(quotesRepository: quotesRepository);
    });

    test("should return quote by an author from repository", () async {
      when(
        () => quotesRepository.getQuoteBy(quote.author),
      ).thenAnswer((_) => Future.value(Success(quote)));

      final result = await getQuoteByUseCase(quote.author);

      expect(result.tryGetSuccess()?.author, quote.author);
      verify(() => quotesRepository.getQuoteBy(quote.author)).called(1);
    });

    test(
      "should return NoQuote when author isn't present in the repository",
      () async {
        when(
          () => quotesRepository.getQuoteBy(quote.author),
        ).thenAnswer((_) => Future.value(Error(NoQuote())));

        final result = await getQuoteByUseCase(quote.author);

        expect(result, Error(NoQuote()));
        verify(() => quotesRepository.getQuoteBy(quote.author)).called(1);
      },
    );
  });
}
