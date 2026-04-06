import 'package:flutter/material.dart';
import 'package:tracking_diary/l10n/app_localizations.dart';
import 'package:tracking_diary/pages/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
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


