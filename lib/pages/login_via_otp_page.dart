import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:thegorgeousotp/stores/login_store.dart';

import 'package:thegorgeousotp/widgets/loader_hud.dart';

import '../theme.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_otp';
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Observer(
          builder: (_) => LoaderHUD(
            inAsyncCall: loginStore.isLoginLoading,
            child: Scaffold(
              backgroundColor: Colors.white,
              key: loginStore.loginScaffoldKey,
              body: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 400,
                      height: 300,
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: const Color(0xffe6dbdd),
                        elevation: 10,
                        child: Column(
                          children: <Widget>[
                            Container(
                                padding:
                                    const EdgeInsets.only(top: 40, bottom: 20),
                                constraints:
                                    const BoxConstraints(maxWidth: 500),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'We will send you an ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'One Time Password ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'on this mobile number',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ]),
                                )),
                            Container(
                              height: 40,
                              constraints: const BoxConstraints(maxWidth: 500),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: CupertinoTextField(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                controller: phoneController,
                                clearButtonMode: OverlayVisibilityMode.editing,
                                keyboardType: TextInputType.phone,
                                maxLines: 1,
                                placeholder: '+91...',
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              constraints: const BoxConstraints(maxWidth: 500),
                              child: RaisedButton(
                                onPressed: () {
                                  if (phoneController.text.isNotEmpty) {
                                    loginStore.getCodeWithPhoneNumber(context,
                                        phoneController.text.toString());
                                  } else {
                                    loginStore.loginScaffoldKey.currentState
                                        .showSnackBar(const SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        'Please enter a phone number',
                                        style: TextStyle(
                                          color: Color(0xffe6dbdd),
                                        ),
                                      ),
                                    ));
                                  }
                                },
                                color: Colors.black,
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
                                        'Next',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          color: Colors.white,
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
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Container(
// height: MediaQuery.of(context).size.height,
// child: Column(
// children: <Widget>[
// Expanded(
// flex: 2,
// child: Column(
// children: <Widget>[
// Container(
// margin: const EdgeInsets.symmetric(
// horizontal: 20, vertical: 20),
// child: Stack(
// children: <Widget>[
// Center(
// child: Container(
// height: 240,
// constraints:
// const BoxConstraints(maxWidth: 500),
// margin: const EdgeInsets.only(top: 100),
// decoration: const BoxDecoration(
// color: Color(0xFFE1E0F5),
// borderRadius: BorderRadius.all(
// Radius.circular(30))),
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// Expanded(
// flex: 1,
// child: Column(
// children: <Widget>[
// Container(
// constraints:
// const BoxConstraints(maxWidth: 500),
// margin: const EdgeInsets.symmetric(
// horizontal: 10),
// child: RichText(
// textAlign: TextAlign.center,
// text: const TextSpan(children: <TextSpan>[
// TextSpan(
// text: 'We will send you an ',
// style: TextStyle(
// color: MyColors.primaryColor)),
// TextSpan(
// text: 'One Time Password ',
// style: TextStyle(
// color: MyColors.primaryColor,
// fontWeight: FontWeight.bold)),
// TextSpan(
// text: 'on this mobile number',
// style: TextStyle(
// color: MyColors.primaryColor)),
// ]),
// )),
// Container(
// height: 40,
// constraints:
// const BoxConstraints(maxWidth: 500),
// margin: const EdgeInsets.symmetric(
// horizontal: 20, vertical: 10),
// child: CupertinoTextField(
// padding: const EdgeInsets.symmetric(
// horizontal: 16),
// decoration: const BoxDecoration(
// color: Colors.white,
// borderRadius:
// BorderRadius.all(Radius.circular(4))),
// controller: phoneController,
// clearButtonMode:
// OverlayVisibilityMode.editing,
// keyboardType: TextInputType.phone,
// maxLines: 1,
// placeholder: '+91...',
// ),
// ),
// Container(
// margin: const EdgeInsets.symmetric(
// horizontal: 20, vertical: 10),
// constraints:
// const BoxConstraints(maxWidth: 500),
// child: RaisedButton(
// onPressed: () {
// if (phoneController.text.isNotEmpty) {
// loginStore.getCodeWithPhoneNumber(context,
// phoneController.text.toString());
// } else {
// loginStore.loginScaffoldKey.currentState
//     .showSnackBar(const SnackBar(
// behavior: SnackBarBehavior.floating,
// backgroundColor: Colors.red,
// content: Text(
// 'Please enter a phone number',
// style: TextStyle(color: Colors.white),
// ),
// ));
// }
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
// 'Next',
// style: TextStyle(color: Colors.white),
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
// )
// ],
// ),
// )
// ],
// ),
// ),
