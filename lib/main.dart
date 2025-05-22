import 'package:flutter/material.dart';
import 'package:quotes_application/dependencies.dart';
import 'package:quotes_application/presentation/app.dart';
import 'package:quotes_application/providers.dart';

void main() {
  setupDependencies();
  runApp(const Providers(child: App()));
}
