import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TpaPage extends StatefulWidget {
  @override
  _TpaPageState createState() => _TpaPageState();
}

class _TpaPageState extends State<TpaPage> {
//  final String url = "https://lowcarbon-malang.id/system/api/admin/tpa";
  String idTpa = "";

  final String url = "https://lowcarbon-malang.id/system/api/admin/tps?id_tpa=";
  List data;

  Future<String> getTpaData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idTpa = prefs.getString("id_tpa");
    print(idTpa);
    var res = await http.get(Uri.encodeFull(url + idTpa), headers: {"Accept": "application/json"});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody["data"];
      print(resBody);
    });

    return "Succes!";
  }
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
              SliverAppBar(
                expandedHeight: 150.0,
                floating: false,
                pinned: true,
                snap: false,
                backgroundColor: Colors.lightBlueAccent,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("DAFTAR TPS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  )),
//                  background: Image.network(
//                    "https://cdn0-production-images-kly.akamaized.net/mbCCCWjkvTV9b1Jf5p2Oc1zOuA4=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2832638/original/037807400_1560947825-20190619-Anya-Geraldine-1.jpg",
//                  fit: BoxFit.cover),
                  background: Image.network(
                    "https://images.pexels.com/photos/392586/pexels-photo-392586.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                  fit: BoxFit.cover),
                ),
              ),
        ];
      },
      body: ListView.builder(
        padding: EdgeInsets.only(top: 50.0),
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
//          print(data[index]['nama_tpa']);
          return new Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Tps(
                      usernameTps: data[index]['title'],
                      passwordTps: data[index]['password_tps'],
                      namaTps: data[index]['nama_tps'],
                      lngTps: data[index]['lng_tps'],
                      latTps: data[index]['lat_tps'],
                      idTps: data[index]['id_tps'],
                      gambarTps: data[index]['gambar_tps'],
                      alamatTps: data[index]['alamat_tps'],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTpaData();
  }

}

class Tps extends StatelessWidget {
  String idTps;
  String idTpa;
  String namaTps;
  String alamatTps;
  String latTps;
  String lngTps;
  String gambarTps;
  String usernameTps;
  String passwordTps;


  Tps({
    this.idTps,
    this.idTpa,
    this.namaTps,
    this.alamatTps,
    this.latTps,
    this.lngTps,
    this.gambarTps,
    this.usernameTps,
    this.passwordTps,
  });

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      child: new Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: new Container(
          padding: new EdgeInsets.all(60.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage( "https://lowcarbon-malang.id/system/assets/" + gambarTps),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter
            )
          ),
          child: new Column(
            children: <Widget>[
              new Text(namaTps, style: new TextStyle(color: Colors.white, fontSize: 15.0, fontStyle: FontStyle.normal))
            ],
          ),
        ),
      )
    );
  }
}