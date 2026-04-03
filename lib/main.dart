import 'package:flutter/material.dart';
import 'package:tracking_diary/l10n/app_localizations.dart';
import 'package:tracking_diary/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track Folio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Georgia',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: const Locale('en'),
       supportedLocales: const [
        Locale('en'),
        Locale('ko'),
      ],
      home: const LoginPage(),
    );
  }
}


