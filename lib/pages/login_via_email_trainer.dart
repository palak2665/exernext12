import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'trainer.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'loginScreenTrainer';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              height: 250,
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
                      height: 40,
                      constraints: const BoxConstraints(maxWidth: 500),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.left,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                            hintText: 'Enter your email',
                            fillColor: Colors.white),
                      ),
                    ),
                    Container(
                      height: 40,
                      constraints: const BoxConstraints(maxWidth: 500),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextField(
                        obscureText: true,
                        textAlign: TextAlign.left,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                            hintText: 'Enter your password',
                            fillColor: Colors.white),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: RaisedButton(
                        onPressed: () async {
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => trainerpage()),
                              );
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        color: Colors.black,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'Next',
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
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
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatefulWidget {
//   static const String id = 'loginScreenTrainer';
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             const SizedBox(
//               height: 48.0,
//             ),
//             TextField(
//               keyboardType: TextInputType.emailAddress,
//               textAlign: TextAlign.center,
//               style: const TextStyle(color: Colors.black),
//               onChanged: (value) {
//                 //Do something with the user input.
//               },
//               decoration: const InputDecoration(
//                 hintText: 'Enter your email',
//                 hintStyle: TextStyle(color: Colors.grey),
//                 contentPadding:
//                     EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(color: Colors.lightBlueAccent, width: 1.0),
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 8.0,
//             ),
//             TextField(
//               obscureText: true,
//               textAlign: TextAlign.center,
//               style: const TextStyle(color: Colors.black),
//               onChanged: (value) {
//                 //Do something with the user input.
//               },
//               decoration: const InputDecoration(
//                 hintText: 'Enter your password.',
//                 hintStyle: TextStyle(color: Colors.grey),
//                 contentPadding:
//                     EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(color: Colors.lightBlueAccent, width: 1.0),
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 24.0,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               child: Material(
//                 color: Colors.lightBlueAccent,
//                 borderRadius: const BorderRadius.all(Radius.circular(30.0)),
//                 elevation: 5.0,
//                 child: MaterialButton(
//                   onPressed: () {
//                     //Implement login functionality.
//                   },
//                   minWidth: 200.0,
//                   height: 42.0,
//                   child: const Text(
//                     'Log In',
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
