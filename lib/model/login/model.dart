import 'package:flutter/material.dart';

class AppModel {

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  bool _obscureTextLogin = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController = new TextEditingController();
}

class Tpa {
    String idTpa;
    String namaTpa;
    String alamatTpa;
    String noAlamat;
    String rt;
    String rw;
    String districtId;
    String latTpa;
    String lngTpa;
    String gambarTpa;
    String usernameTpa;
    String passwordTpa;
    dynamic kmlFile;

    Tpa({
        this.idTpa,
        this.namaTpa,
        this.alamatTpa,
        this.noAlamat,
        this.rt,
        this.rw,
        this.districtId,
        this.latTpa,
        this.lngTpa,
        this.gambarTpa,
        this.usernameTpa,
        this.passwordTpa,
        this.kmlFile,
    });

    factory Tpa.fromJson(Map<String, dynamic> json) => Tpa(
        idTpa: json["id_tpa"],
        namaTpa: json["nama_tpa"],
        alamatTpa: json["alamat_tpa"],
        noAlamat: json["no_alamat"],
        rt: json["rt"],
        rw: json["rw"],
        districtId: json["district_id"],
        latTpa: json["lat_tpa"],
        lngTpa: json["lng_tpa"],
        gambarTpa: json["gambar_tpa"],
        usernameTpa: json["username_tpa"],
        passwordTpa: json["password_tpa"],
        kmlFile: json["kml_file"],
    );

    Map<String, dynamic> toJson() => {
        "id_tpa": idTpa,
        "nama_tpa": namaTpa,
        "alamat_tpa": alamatTpa,
        "no_alamat": noAlamat,
        "rt": rt,
        "rw": rw,
        "district_id": districtId,
        "lat_tpa": latTpa,
        "lng_tpa": lngTpa,
        "gambar_tpa": gambarTpa,
        "username_tpa": usernameTpa,
        "password_tpa": passwordTpa,
        "kml_file": kmlFile,
    };
}