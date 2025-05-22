import 'dart:math';

import 'package:quotes_application/data/datasources/quotes_datasource.dart';
import 'package:quotes_application/data/models/quote_model.dart';
import 'package:multiple_result/multiple_result.dart';

class LocalQuotesDataSource implements QuotesDataSource {
  static final quotes =
      [
        ["To be or not to be", "W. Shakespeare"],
        ["Ladran Sancho", "Quijote"],
      ].map((arr) => QuoteModel(text: arr[0], author: arr[1])).toList();

  @override
  Future<Result<QuoteModel, Exception>> getQuote() async {
    final index = Random().nextInt(quotes.length);
    return Success(quotes[index]);
  }
}
