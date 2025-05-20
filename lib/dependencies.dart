import 'package:quotes_application/data/datasources/local/local_quotes_datasource.dart';
import 'package:quotes_application/data/datasources/quotes_datasource.dart';
import 'package:quotes_application/data/repositories/quotes_repository_impl.dart';
import 'package:quotes_application/domain/repositories/quotes_repository.dart';
import 'package:quotes_application/domain/usecases/get_quote_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<QuotesDataSource>(() => LocalQuotesDataSource());
  getIt.registerLazySingleton<QuotesRepository>(
    () => QuotesRepositoryImpl(quotesDataSource: getIt()),
  );
  getIt.registerLazySingleton<GetQuoteUseCase>(
    () => GetQuoteUseCase(quotesRepository: getIt()),
  );
}
