import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_application/presentation/models/quote_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Consumer<QuoteViewModel>(
        builder: (BuildContext context, value, Widget? child) {
          String text = "";
          String author = "";
          Color? color = Theme.of(context).textTheme.headlineMedium?.color;

          switch (value.state) {
            case QuoteViewModelStateLoading():
              break;
            case QuoteViewModelStateQuote(quote: var quote):
              text = quote.text;
              author = quote.author;
              break;
            case QuoteViewModelStateError(error: var error):
              text = error.toString();
              break;
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  text,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium?.copyWith(color: color),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(author),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<QuoteViewModel>()..loadQuote(),
        tooltip: 'New quote',
        child: const Icon(Icons.repeat),
      ),
    );
  }
}
