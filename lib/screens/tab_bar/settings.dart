import 'package:bodycomposition/services/authentication.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key key, this.auth, this.logoutCallback, this.userId}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Container(
            child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 10.0),
                child: SizedBox(
                  height: 55.0,
                  child: new RaisedButton(
                    elevation: 5.0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.blue,
                    child: new Text('Logout',
                        style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                    onPressed: didTapLogout,
                  ),
                )
            )
        ),
      ),
    );
  }

  void didTapLogout() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
}