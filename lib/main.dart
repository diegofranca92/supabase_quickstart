import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Pages
import 'pages/home_page.dart';
import 'pages/signUp_page.dart';
import 'pages/signIn_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://jntdbzzsqecleksmyxyc.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYyNTU3NjAxMCwiZXhwIjoxOTQxMTUyMDEwfQ.rr066Tf0eB9L8i92b1951G1G4_lylGzaZxUVnyus8aM',
      authCallbackUrlHostname: 'login-callback', // optional
      debug: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.green,
          ),
        ),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SignInPage(),
        '/signup': (_) => const SignUpPage(),
        '/home': (_) => const HomePage(),
      },
    );
  }
}
