import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:provider/provider.dart';
import 'package:thegorgeousotp/stores/login_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              'ExerNEXT',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text('Palak Sharma'),
                  accountEmail: Text('palaks2665@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      'P',
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.apartment),
                  title: Text('Community'),
                ),
                const ListTile(
                  leading: Icon(Icons.book_outlined),
                  title: Text('Attendance'),
                ),
                const ListTile(
                  leading: Icon(Icons.fit_screen),
                  title: Text('Weight Tracker'),
                ),
                const ListTile(
                  leading: Icon(Icons.fitness_center_outlined),
                  title: Text('Workouts'),
                ),
                const ListTile(
                  leading: Icon(Icons.calculate_outlined),
                  title: Text('Calories Calculator'),
                ),
                const ListTile(
                  leading: Icon(Icons.fastfood),
                  title: Text('Diet'),
                ),
                const ListTile(
                  leading: Icon(Icons.chat_outlined),
                  title: Text('Consult an Expert'),
                ),
                const ListTile(
                  leading: Icon(Icons.store),
                  title: Text('Shop'),
                ),
                const ListTile(
                  leading: Icon(Icons.laptop_chromebook_outlined),
                  title: Text('Developers Option'),
                ),
                const ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Log Out'),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Exernext1(),
          ),
        );
      },
    );
  }
}

class Exernext1 extends StatefulWidget {
  @override
  _ExernextState createState() => _ExernextState();
}

class _ExernextState extends State<Exernext1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(builder: (_, loginStore, __) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  color: Colors.black,
                  child: InkWell(
                    child: Column(
                      children: [
                        Flexible(
                            child: Row(
                          children: [
                            _quickbuttons('Scan QR', Icons.qr_code),
                            _quickbuttons('Weight Tracker', Icons.fit_screen),
                            _quickbuttons(
                                'Workout', Icons.fitness_center_rounded),
                            _quickbuttons('Diet', Icons.fastfood),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: Colors.black,
                  child: Column(
                    children: [
                      Flexible(
                          child: Row(
                        children: [
                          _dashboard('Sessions Attended'),
                          _dashboard('Workout Progress'),
                        ],
                      )),
                      Flexible(
                          child: Row(
                        children: [
                          _dashboard('Goal Progress'),
                          _dashboard('Sessions to Expire'),
                        ],
                      )),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  color: Colors.black,
                  child: Column(
                    children: [_calendar('Calendar')],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 70.0,
          height: 70.0,
          child: FloatingActionButton(
            shape: const PolygonBorder(
              sides: 6,
              borderRadius: 8.0,
              rotate: 0,
            ),
            onPressed: () {
              loginStore.signOut(context);
            },
            backgroundColor: Colors.lightGreen,
            child: const Icon(Icons.home, size: 30),
            elevation: 1.0,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                const Expanded(
                  child: IconButton(
                    padding: EdgeInsets.only(right: 28.0),
                    icon: Icon(Icons.forum, color: Colors.lightGreen, size: 30),
                  ),
                ),
                const Expanded(
                  child: IconButton(
                      padding: EdgeInsets.only(right: 35.0),
                      icon: Icon(Icons.store,
                          color: Colors.lightGreen, size: 30)),
                ),
                const Expanded(
                  child: IconButton(
                      padding: EdgeInsets.only(left: 35.0),
                      icon: Icon(Icons.notifications,
                          color: Colors.lightGreen, size: 30)),
                ),
                const Expanded(
                  child: IconButton(
                      padding: EdgeInsets.only(left: 28.0),
                      icon: Icon(Icons.settings,
                          color: Colors.lightGreen, size: 30)),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }

  Expanded _quickbuttons(String title, IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        //padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.grey[900], borderRadius: BorderRadius.circular(10.0)),
        child: Material(
          color: Colors.white.withOpacity(0.0),
          child: InkWell(
            splashColor: Colors.lightGreen,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(icon, size: 30, color: Colors.white),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }

  Expanded _dashboard(String title) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.grey[900], borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded _calendar(String title) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.grey[900], borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
