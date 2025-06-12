import 'package:multiple_result/multiple_result.dart';

import 'package:quotes_application/domain/entities/quote.dart';
import 'package:quotes_application/domain/repositories/quotes_repository.dart';

class GetQuoteByUseCase {
  final QuotesRepository quotesRepository;

  const GetQuoteByUseCase({required this.quotesRepository});

  Future<Result<Quote, Exception>> call(String author) async {
    final result = await quotesRepository.getQuoteBy(author);
    return result;
  }
}
