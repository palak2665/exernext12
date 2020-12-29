import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(trainerpage());

class trainerpage extends StatelessWidget {
  static const String id = 'Trainerpage';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exernext',
      home: trainer(),
    );
  }
}

class trainer extends StatefulWidget {
  @override
  _trainerState createState() => _trainerState();
}

class _trainerState extends State<trainer> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
//    Firestore.instance.collection('mountains').document()
//        .setData({ 'title': 'Mount Baker', 'type': 'volcano' });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'ExerNEXT',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: Userlist(),
      backgroundColor: Colors.black,
    );
  }
}

class Userlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // ignore: deprecated_member_use
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        // ignore: unnecessary_new
        return new ListView.builder(
            // ignore: deprecated_member_use
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              // ignore: deprecated_member_use
              final DocumentSnapshot users = snapshot.data.documents[index];
              return Container(
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.white.withOpacity(0.0),
                  child: InkWell(
                    splashColor: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      child: ListTile(
                        title: Center(
                          child: Text(
                            users['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        subtitle: Center(
                          child: Text(
                            users['email'],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        //tileColor: Colors.black,
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Card(
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        const Icon(
                                          Icons.account_circle,
                                          size: 30,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            users['name'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            users['email'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Text(
                                            users['mobile no'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        RaisedButton(
                                          padding: EdgeInsets.all(10.0),
                                          splashColor: Colors.lightGreen,
                                          color: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          child: const Text(
                                            "Delete User",
                                            style: TextStyle(
                                                fontSize: 25.0,
                                                color: Colors.white),
                                          ),
                                          onPressed: () {
                                            // ignore: deprecated_member_use
                                            snapshot
                                                .data.documents[index].reference
                                                .delete();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(8.0),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            });
      },
    );
  }
}


