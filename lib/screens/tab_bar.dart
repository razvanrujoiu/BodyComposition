import 'package:bodycomposition/Utils/HexColor.dart';
import 'package:bodycomposition/screens/auth/enrollment_page.dart';
import 'package:bodycomposition/screens/tab_bar/dashboard.dart';
import 'package:bodycomposition/screens/tab_bar/profile.dart';
import 'package:bodycomposition/screens/tab_bar/settings.dart';
import 'package:bodycomposition/screens/tab_bar/statistics.dart';
import 'package:bodycomposition/services/authentication.dart';
import 'package:flutter/material.dart';

import 'tab_bar/dashboard.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.auth, this.logoutCallback, this.userId}) : super(key: key);

  @override
  _Home createState() => _Home();

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

}

class _Home extends State<Home> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Dashboard(),
    Statistics(),
    Profile(),
    Settings(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
//        shape: CircularNotchedRectangle(),
//        notchMargin: 5,
        child: Container(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Dashboard(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 0 ? Colors.white : Colors.grey.shade400,
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.white : Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Profile(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: currentTab == 2 ? Colors.white : Colors.grey.shade400,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.white : Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Statistics(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.timeline,
                          color: currentTab == 1 ? Colors.white : Colors.grey.shade400,
                        ),
                        Text(
                          'Statistics',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.white : Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Settings(userId: widget.userId, auth: widget.auth, logoutCallback: widget.logoutCallback, ); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: currentTab == 3 ? Colors.white : Colors.grey.shade400,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.white : Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}