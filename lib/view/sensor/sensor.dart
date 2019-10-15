import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class SensorPage extends StatefulWidget {
  @override
  _SensorPageState createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  Widget body() {
    return Column(
      children: <Widget>[
        Text('Profile Page')
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "http://lowcarbon-malang.id",
      appBar: new AppBar(
        title: const Text('Konten Edukasi'),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.greenAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              Text("Menunggu...")
            ],
          ),
        ),
      ),
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