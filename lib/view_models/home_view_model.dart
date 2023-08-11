import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:valbury_coding_test/models/home_model.dart';
import 'package:valbury_coding_test/models/hospital_section_model.dart';
import 'package:valbury_coding_test/res/values/dummy_jsons.dart';
import 'package:valbury_coding_test/utils/home_types.dart';

class HomeViewModel with ChangeNotifier {
  var homeListModel = <HomeModel>[];

  void fetchHomeDummyList() {
    debugPrint("HomeViewModel => fetchHomeDummyList()");
    dynamic hospitalDummyData = jsonDecode(DummyJson.instance.hospitalAll);
    HomeModel hospitalHomeModel = HomeModel(
      hospitalSectionModel: HospitalSectionModel.fromJson(hospitalDummyData),
      homeTypes: HomeTypes.hospital
    );
    homeListModel.add(hospitalHomeModel);
    debugPrint("HomeViewModel => fetchHomeDummyList() => home list model size = ${homeListModel.length}");

    notifyListeners();
  }
}