import 'package:flutter/material.dart';
import 'package:adminlowcarbo/model/home/model.dart';
import 'package:adminlowcarbo/presenter/home/presenter.dart';
import 'package:adminlowcarbo/view/home/view.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String title;
  final AppPresenter presenter;

  HomePage(this.presenter, {this.title, Key key}): super (key:key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements AppView{
  AppModel _appModel;
  String nama_tpa = "";
  String gambar_tpa = "";

  Future getBio() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nama_tpa = prefs.getString("nama_tpa");
      gambar_tpa = prefs.getString("gambar_tpa");
    });
  }

  Widget kiri() {
    return Row(
      children: <Widget>[
        Expanded(
          child: chart,
        ),
        Expanded(
          child: kanan(),
        ),
      ],
    );
  }

  Widget kanan() {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(top: 0.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          ),
          RaisedButton(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () {
                            Navigator.pushNamed(context, "/edukasi");
            },
            child: new Text("LAPOR lur"),

          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
          ),
          RaisedButton(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () {
                            Navigator.pushNamed(context, "/onesignal");
            },
            child: new Text("SEE PSUH NOTIF"),

          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
          ),
          RaisedButton(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            textColor: Colors.white,
            color: Colors.redAccent,
            onPressed: (){},
            child: new Text("PENGUMPULAN"),
          ),
        ],
      ),
    );
  }

  Widget kotak1() {
    return Row(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            child: Container(
              height: 80,
              color: Colors.yellowAccent,
              child: Center(
                child: Text("EDUKASI", style: TextStyle(fontSize: 24.0)),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/edukasi");
            },
          )
        ),
        Expanded(
          child: GestureDetector(
            child: Container(
  //            margin: EdgeInsets.only(bottom: 100),
              height: 80,
              color: Colors.greenAccent,
              child: Center(
                child: Text("SEBARAN TPA", style: TextStyle(fontSize: 24.0),),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, "/tpa");
            },
          )
        ),
      ],
    );
  }

  Widget kotak2() {
    return Row(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            child: Container(
  //            margin: EdgeInsets.only(bottom: 100),
              height: 80,
              color: Colors.deepOrangeAccent,
              child: Center(
                child: Text("SENSOR", style: TextStyle(fontSize: 24.0),),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, "/sensor");
            },
          )
        ),
        Expanded(
          child: GestureDetector(
            child: Container(
  //            margin: EdgeInsets.only(bottom: 100),
              height: 80,
              color: Colors.lightBlueAccent,
              child: Center(
                child: Text("SEBARAN TPS", style: TextStyle(fontSize: 24.0),),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, "/tps");
            },
          )
        ),
      ],
    );
  }

  Widget body() {
    return Column(
      children: <Widget>[
        Expanded(
          child: kiri(),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            children: <Widget>[
              Text('Muhammad Faisal ', style: TextStyle(fontSize: 50.0)),
              Text('Muhammad Faisal ', style: TextStyle(fontSize: 50.0)),
              Text('Muhammad Faisal ', style: TextStyle(fontSize: 50.0)),
              Text('Muhammad Faisal ', style: TextStyle(fontSize: 50.0)),
              Text('Muhammad Faisal ', style: TextStyle(fontSize: 50.0)),
            ],
          ),
        ),
        kotak1(),
        kotak2()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nama_tpa)),
      drawer: Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text(nama_tpa),
              decoration: BoxDecoration(
                image: new DecorationImage(image: NetworkImage("http://lowcarbon-malang.id/system/assets/" + gambar_tpa)),

              )
            ),
            ListTile(
              title: Text('Home'),
              trailing: Icon(Icons.home),
              selected: true,
              onTap: (){
                Navigator.pushReplacementNamed(context, "/home");
              },
            ),
            ListTile(
              title: Text('Profile'),
              trailing: Icon(Icons.update),
              onTap: (){
                Navigator.pushReplacementNamed(context, "/profile");
              },
            ),
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.exit_to_app),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.pushReplacementNamed(context, "/login");
              },
            )
          ],
        ),
      ),
      body: body()
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
  void refreshData(AppModel model) {
    // TODO: implement refreshData
    setState(() {
      this._appModel = model;
      this.widget.presenter.view = this;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBio();
  }

}

  var data = [
    Sales("Mon", 30, Colors.red),
    Sales("Tue", 20, Colors.blueAccent),
    Sales("Wed", 70, Colors.greenAccent),
    Sales("Thur", 100, Colors.pinkAccent),
  ];

  var series = [
    charts.Series(
      domainFn: (Sales sales,_) => sales.Day,
      measureFn: (Sales sales,_) => sales.Sold,
      id: "Sales",
      data: data,
      colorFn: (Sales sales,_) => sales.color,
      labelAccessorFn: (Sales sales,_) => '${sales.Day} : ${sales.Sold}'
    )
  ];

  var chart = charts.PieChart(
    series,
    defaultRenderer: charts.ArcRendererConfig(
      arcRendererDecorators: [charts.ArcLabelDecorator()],
      arcWidth: 300,
    ),
    animate: true,
  );

class Sales {
  final String Day;
  final int Sold;
  final charts.Color color;

  Sales(this.Day, this.Sold, Color color)
      :this.color = charts.Color(r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
