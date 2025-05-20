import 'package:json_annotation/json_annotation.dart';

import 'package:quotes_application/domain/entities/quote.dart';

part 'quote_model.g.dart';

@JsonSerializable()
class QuoteModel {
  final String text;
  final String author;

  const QuoteModel({required this.text, required this.author});

  factory QuoteModel.fromQuote(quote) =>
      QuoteModel(text: quote.text, author: quote.author);

  Quote toQuote() => Quote(text: text, author: author);

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteModelToJson(this);
}
