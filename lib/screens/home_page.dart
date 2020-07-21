import 'package:bodycomposition/Utils/HexColor.dart';
import 'package:flutter/material.dart';
import 'package:bodycomposition/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _age;
  String _height;
  String _weight;

  @override
  void initState() {
    super.initState();
  }


  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: HexColor.fromHex('#CFF9FE'),
      body: Center(
        child: ListView(
          padding: EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
          shrinkWrap: true,
          children: <Widget>[
            showAgeInput(),
            showHeightInput(),
            showWeightInput(),
            showSubmitButton()
          ],
        ),
      ),
//        appBar: new AppBar(
//          title: new Text('Body composition'),
//          actions: <Widget>[
//            new FlatButton(
//                child: new Text('Logout',
//                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
//                onPressed: signOut)
//          ],
//        ),
    );
  }

  Widget showAgeInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(44.0, 0.0, 44.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        autofocus: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'Age',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          contentPadding: new EdgeInsets.symmetric(vertical: 18.0, horizontal: 0.0),
        ),
        validator: (value) => value.isEmpty ? 'Please fill the height field' : null,
        onSaved: (value) => _height = value.trim(),
      ),
    );
  }


  Widget showHeightInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(44.0, 22.0, 44.0, 0.0),
      child: TextFormField(

        maxLines: 1,
        keyboardType: TextInputType.number,
        autofocus: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'Height',
          contentPadding: new EdgeInsets.symmetric(vertical: 18.0, horizontal: 0.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),
        ),
        validator: (value) => value.isEmpty ? 'Please fill the height field' : null,
        onSaved: (value) => _height = value.trim(),
      ),
    );
  }

  Widget showWeightInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(44.0, 22.0, 44.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        autofocus: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'Weight',
          contentPadding: new EdgeInsets.symmetric(vertical: 18.0, horizontal: 0.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),
        ),
        validator: (value) => value.isEmpty ? 'Please fill the weight field' : null,
        onSaved: (value) => _weight = value.trim(),
      ),
    );
  }

  Widget showSubmitButton() {
    return new Padding(
        padding:EdgeInsets.fromLTRB(44.0, 30.0, 44.0, 45.0),
        child: SizedBox(
          height: 55.0,
          child: new RaisedButton(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)
              ),
              color: Colors.blue,
              child: Text('Next'),
              onPressed: saveData),
        ),
    );
  }

  void saveData() {
//    Navigator.push(context, route)
  }
}
