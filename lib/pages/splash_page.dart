import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thegorgeousotp/pages/first.dart';
import 'package:thegorgeousotp/pages/home_page.dart';
import 'package:thegorgeousotp/pages/login_via_otp_page.dart';
import 'package:thegorgeousotp/stores/login_store.dart';
import 'package:thegorgeousotp/theme.dart';

class SplashPage extends StatefulWidget {
  static const String id = 'splash_page';
  const SplashPage({Key key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<LoginStore>(context, listen: false)
        .isAlreadyAuthenticated()
        .then((result) {
      if (result) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const HomePage()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => WelcomeScreen()),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.primaryColor,
    );
  }
}
