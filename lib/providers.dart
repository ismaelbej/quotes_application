import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_application/dependencies.dart';
import 'package:quotes_application/presentation/models/quote_view_model.dart';

class Providers extends StatelessWidget {
  final Widget child;
  const Providers({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuoteViewModel(getQuoteUseCase: getIt())..loadQuote(),
        ),
      ],
      child: child,
    );
  }
}
