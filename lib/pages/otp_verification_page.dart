import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

import 'package:provider/provider.dart';
import 'package:thegorgeousotp/stores/login_store.dart';

import 'package:thegorgeousotp/widgets/loader_hud.dart';

import '../theme.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key key}) : super(key: key);
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          text[position],
          style: const TextStyle(color: Colors.white),
        )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Observer(
          builder: (_) => LoaderHUD(
            inAsyncCall: loginStore.isOtpLoading,
            child: Scaffold(
              backgroundColor: Colors.black,
              key: loginStore.otpScaffoldKey,
              appBar: AppBar(
                leading: IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.lightGreen,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                elevation: 0,
                backgroundColor: Colors.black,
                brightness: Brightness.light,
              ),
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: const Text(
                                        'Enter 6 digits verification code sent to your number',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w500))),
                                Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 500),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      otpNumberWidget(0),
                                      otpNumberWidget(1),
                                      otpNumberWidget(2),
                                      otpNumberWidget(3),
                                      otpNumberWidget(4),
                                      otpNumberWidget(5),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            constraints: const BoxConstraints(maxWidth: 500),
                            child: RaisedButton(
                              onPressed: () {
                                loginStore.validateOtpAndLogin(context, text);
                              },
                              color: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14))),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const Text(
                                      'Confirm',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Colors.lightGreen,
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          NumericKeyboard(
                            onKeyboardTap: _onKeyboardTap,
                            textColor: Colors.white,
                            rightIcon: const Icon(
                              Icons.backspace,
                              color: Colors.lightGreen,
                            ),
                            rightButtonFn: () {
                              setState(() {
                                text = text.substring(0, text.length - 1);
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Scaffold(
// backgroundColor: Colors.white,
// key: loginStore.loginScaffoldKey,
// body: Stack(
// children: <Widget>[
// Column(
// children: <Widget>[
// Expanded(
// child: Container(
// color: Colors.black,
// ),
// ),
// Expanded(
// child: Container(
// color: Colors.white,
// ),
// ),
// ],
// ),
// Center(
// child: Column(
// children: [
// Container(
// width: 400,
// height: 900,
// padding: const EdgeInsets.all(10.0),
// child: Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15.0),
// ),
// color: const Color(0xffe6dbdd),
// elevation: 10,
// child: Column(
// children: <Widget>[
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceEvenly,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: <Widget>[
// otpNumberWidget(0),
// otpNumberWidget(1),
// otpNumberWidget(2),
// otpNumberWidget(3),
// otpNumberWidget(4),
// otpNumberWidget(5),
// ],
// ),
// Container(
// margin: const EdgeInsets.symmetric(
// horizontal: 20, vertical: 10),
// constraints:
// const BoxConstraints(maxWidth: 500),
// child: RaisedButton(
// onPressed: () {
// loginStore.validateOtpAndLogin(
// context, text);
// },
// color: MyColors.primaryColor,
// shape: const RoundedRectangleBorder(
// borderRadius: BorderRadius.all(
// Radius.circular(14))),
// child: Container(
// padding: const EdgeInsets.symmetric(
// vertical: 8, horizontal: 8),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: <Widget>[
// const Text(
// 'Confirm',
// style:
// TextStyle(color: Colors.white),
// ),
// Container(
// padding: const EdgeInsets.all(8),
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.all(
// Radius.circular(20)),
// color: MyColors.primaryColorLight,
// ),
// child: const Icon(
// Icons.arrow_forward_ios,
// color: Colors.white,
// size: 16,
// ),
// )
// ],
// ),
// ),
// ),
// ),
// NumericKeyboard(
// onKeyboardTap: _onKeyboardTap,
// textColor: MyColors.primaryColorLight,
// rightIcon: const Icon(
// Icons.backspace,
// color: MyColors.primaryColorLight,
// ),
// rightButtonFn: () {
// setState(() {
// text = text.substring(0, text.length - 1);
// });
// },
// )
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
