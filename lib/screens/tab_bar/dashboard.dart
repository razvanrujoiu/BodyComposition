import 'package:bodycomposition/Utils/HexColor.dart';
import 'package:bodycomposition/screens/root_page.dart';
import 'package:bodycomposition/services/authentication.dart';
import 'package:flutter/material.dart';

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
      ), backgroundColor: Colors.grey.shade300
    );
  }
}