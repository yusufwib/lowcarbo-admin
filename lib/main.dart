import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

// home
import './view/home/home.dart';
import './presenter/home/presenter.dart';

//login
import './view/login/login.dart';
import './presenter/login/presenter.dart';

//profile
import './view/profile/profile.dart';
import './presenter/profile/presenter.dart';

//tpa
import './view/tpa/tpa.dart';

//tps
import './view/tps/tps.dart';

//sensor
import './view/sensor/sensor.dart';

//edukasi
import './view/edukasi/edukasi.dart';

Future<void> main() async {
  bool status;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  status = prefs.getBool("logged_in");
  if (status == true) {
    status = true;
  } else {
    status = false;
  }

  runApp(new MaterialApp(
    title: "LOWCARBON",
    home: status ? HomePage(HomePageAppPresenter() ,title: "DASHBOARD") : Login(new LoginAppPresenter(), title: "LOGIN"),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder> {
      "/login": (BuildContext context) => new Login(new LoginAppPresenter(), title: "LOGIN"),
      "/home": (BuildContext context) => new HomePage(HomePageAppPresenter(), title: "DASHBOARD"),
      "/profile": (BuildContext context) => new ProfilePage(),
      "/tpa": (BuildContext context) => new TpaPage(),
      "/tps": (BuildContext context) => new TpsPage(),
      "/sensor": (BuildContext context) => new SensorPage(),
      "/edukasi": (BuildContext context) => new EdukasiPage(),
    },
  ));
}