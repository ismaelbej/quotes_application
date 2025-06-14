import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  final String text;
  final String author;
  final Color color;

  const Quote({
    super.key,
    required this.text,
    required this.author,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(
      context,
    ).textTheme.headlineMedium?.copyWith(color: color);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(text, style: style),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(padding: const EdgeInsets.all(24.0), child: Text(author)),
            ],
          ),
        ],
      ),
    );
  }
}
