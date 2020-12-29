import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thegorgeousotp/pages/first.dart';
import 'package:thegorgeousotp/pages/login_via_email_trainer.dart';
import 'package:thegorgeousotp/pages/login_via_otp_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:thegorgeousotp/pages/splash_page.dart';

import 'package:thegorgeousotp/stores/login_store.dart';

// void main() => runApp(App());
// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginStore>(
          create: (_) => LoginStore(),
        )
      ],
      child: MaterialApp(
        initialRoute: SplashPage.id,
        routes: {
          SplashPage.id: (context) => const SplashPage(),
          LoginPage.id: (context) => LoginScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
        },
      ),
    );
  }
}
