import 'package:bodycomposition/Utils/HexColor.dart';
import 'package:bodycomposition/screens/root_page.dart';
import 'package:bodycomposition/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        automaticallyImplyLeading: false,
      ), backgroundColor: Colors.grey.shade300,
      body: ListView(
        children: <Widget>[
          weightWidget(),
          heartWidget()
        ],
      ),
    );
  }

  Widget weightWidget() {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.blue,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.directions_run, size: 80),
              title: Text('Health', style: TextStyle(color: Colors.white)),
              subtitle: Text('Weight', style: TextStyle(color: Colors.white)),
            ),
            ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Edit', style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: const Text('Delete', style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget heartWidget() {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.blue,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
//            showLottieAnimation(),
             ListTile(
               title: Text('Weight', style: TextStyle(color: Colors.white)),
               subtitle: Text('86 kg', style: TextStyle(color: Colors.white)),
             ),
             const ListTile(
              title: Text('Height', style: TextStyle(color: Colors.white)),
              subtitle: Text('175 cm', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget showLottieAnimation() {
    return Container(
      padding: const EdgeInsets.only(top: 75),
      child: Center(
          child: Lottie.asset('assets/images/scale_heart.json',
              width: 100, height: 100, fit: BoxFit.fitHeight)),
    );
  }
}