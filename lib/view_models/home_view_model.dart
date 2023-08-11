import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:valbury_coding_test/models/home_model.dart';
import 'package:valbury_coding_test/models/hospital_section_model.dart';
import 'package:valbury_coding_test/res/values/dummy_jsons.dart';
import 'package:valbury_coding_test/utils/home_types.dart';

class HomeViewModel with ChangeNotifier {
  var homeListModel = <HomeModel>[];

  Future fetchHomeDummyList() async {
    if (homeListModel.isNotEmpty) return;
    dynamic hospitalDummyData = jsonDecode(DummyJson.instance.hospitalAll);
    HomeModel hospitalHomeModel = HomeModel(
      hospitalSectionModel: HospitalSectionModel.fromJson(hospitalDummyData),
      homeTypes: HomeTypes.hospital
    );
    homeListModel.add(hospitalHomeModel);

    notifyListeners();
  }

  Future fetchHospitalFilterById(int id) async {
    switch (id) {
      case 0:
        _fetchHospitalDummyData(DummyJson.instance.hospitalAll);
        break;
      case 1:
        _fetchHospitalDummyData(DummyJson.instance.hospitalBpjs);
        break;
      case 2:
        _fetchHospitalDummyData(DummyJson.instance.hospitalPartner);
        break;
      case 3:
        _fetchHospitalDummyData(DummyJson.instance.hospitalTerdekat);
        break;
      case 4:
        _fetchHospitalDummyData(DummyJson.instance.hospitalTerfavorit);
        break;
      default:
        debugPrint("Invalid filter ID");
    }
  }

  void _fetchHospitalDummyData(dummyJson) {
    dynamic hospitalDummyData = jsonDecode(dummyJson);
    HomeModel hospitalHomeModel = HomeModel(
        hospitalSectionModel: HospitalSectionModel.fromJson(hospitalDummyData),
        homeTypes: HomeTypes.hospital
    );
    int index = _getHospitalPositionFromModel();
    if (index > -1) {
      homeListModel.removeAt(index);
      homeListModel.insert(index, hospitalHomeModel);
    } else {
      homeListModel.insert(0, hospitalHomeModel);
    }
    notifyListeners();
  }

  int _getHospitalPositionFromModel() {
    for (var i = 0; i < homeListModel.length; i++) {
      if (homeListModel[i].homeTypes == HomeTypes.hospital) {
        return i;
      }
    }
    return -1;
  }
}