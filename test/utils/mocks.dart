import 'package:mocktail/mocktail.dart';
import 'package:quotes_application/data/datasources/quotes_datasource.dart';
import 'package:quotes_application/domain/repositories/quotes_repository.dart';

class MockQuotesRepository extends Mock implements QuotesRepository {}

class MockQuotesDataSource extends Mock implements QuotesDataSource {}
