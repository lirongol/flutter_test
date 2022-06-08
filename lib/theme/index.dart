import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: 'Lato',
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch(primarySwatch: Colors.cyan).copyWith(secondary: Colors.cyan[200]),
  );
}
