part of 'quote_view_model.dart';

sealed class QuoteViewModelState extends Equatable {
  const QuoteViewModelState();

  static const loading = QuoteViewModelStateLoading();
  const factory QuoteViewModelState.loadedQuote({required Quote quote}) =
      QuoteViewModelStateQuote;
  const factory QuoteViewModelState.error({required Exception error}) =
      QuoteViewModelStateError;

  @override
  List<Object> get props => [];
}

class QuoteViewModelStateLoading extends QuoteViewModelState {
  const QuoteViewModelStateLoading();
}

class QuoteViewModelStateQuote extends QuoteViewModelState {
  final Quote quote;

  const QuoteViewModelStateQuote({required this.quote});
}

class QuoteViewModelStateError extends QuoteViewModelState {
  final Exception error;

  const QuoteViewModelStateError({required this.error});
}
