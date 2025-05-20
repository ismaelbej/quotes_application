import 'package:multiple_result/multiple_result.dart';

import 'package:quotes_application/domain/entities/quote.dart';
import 'package:quotes_application/domain/repositories/quotes_repository.dart';

class GetQuoteUseCase {
  final QuotesRepository quotesRepository;

  const GetQuoteUseCase({required this.quotesRepository});

  Future<Result<Quote, Exception>> call() async {
    final result = await quotesRepository.getQuote();
    return result;
  }
}
