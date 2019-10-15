import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget body() {
    return Column(
      children: <Widget>[
        Text('Profile Page')
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      drawer: Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("Faisal"),
            ),
            ListTile(
              title: Text('Home'),
              trailing: Icon(Icons.home),
              onTap: (){
                Navigator.pushReplacementNamed(context, "/home");
              },
            ),
            ListTile(
              title: Text('Profile'),
              trailing: Icon(Icons.update),
              selected: true,
              onTap: (){
                Navigator.pushReplacementNamed(context, "/profile");
              },
            ),
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.exit_to_app),
              onTap: (){},
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Text('faisal')
        ],
      )
    );
  }


  Future<Null> _showDialog() async{
//    print('faisal');
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget KolomBawah() {
    return Container(
      color: Colors.green,
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: Colors.blue
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

}