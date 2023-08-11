import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:valbury_coding_test/models/banner_section_model.dart';
import 'package:valbury_coding_test/models/home_model.dart';
import 'package:valbury_coding_test/models/hospital_section_model.dart';
import 'package:valbury_coding_test/res/values/dummy_jsons.dart';
import 'package:valbury_coding_test/utils/home_types.dart';

class HomeViewModel with ChangeNotifier {
  var homeListModel = <HomeModel>[];

  Future fetchHomeDummyList() async {
    if (homeListModel.isNotEmpty) return;

    /* Fetch hospital section dummy data. */
    dynamic hospitalDummyData = jsonDecode(DummyJson.instance.hospitalAll);
    HomeModel hospitalHomeModel = HomeModel(
      hospitalSectionModel: HospitalSectionModel.fromJson(hospitalDummyData),
      homeTypes: HomeTypes.hospital
    );
    homeListModel.add(hospitalHomeModel);

    /* Fetch banner section dummy data. */
    dynamic bannerDummyData = jsonDecode(DummyJson.instance.bannerAll);
    HomeModel bannerHomeModel = HomeModel(
      bannerSectionModel: BannerSectionModel.fromJson(bannerDummyData),
      homeTypes: HomeTypes.banner
    );
    homeListModel.add(bannerHomeModel);

    notifyListeners();
  }

  Future fetchHospitalFilterById(int id) async {
    HomeTypes homeTypes = HomeTypes.hospital;
    switch (id) {
      case 0:
        _fetchHospitalDummyData(
          DummyJson.instance.hospitalAll,
          homeTypes
        );
        break;
      case 1:
        _fetchHospitalDummyData(
          DummyJson.instance.hospitalBpjs,
          homeTypes
        );
        break;
      case 2:
        _fetchHospitalDummyData(
          DummyJson.instance.hospitalPartner,
          homeTypes
        );
        break;
      case 3:
        _fetchHospitalDummyData(
          DummyJson.instance.hospitalTerdekat,
          homeTypes
        );
        break;
      case 4:
        _fetchHospitalDummyData(
          DummyJson.instance.hospitalTerfavorit,
          homeTypes
        );
        break;
      default:
        debugPrint("Invalid filter ID");
    }
  }

  void _fetchHospitalDummyData(
    String dummyJson,
    HomeTypes homeTypes
  ) {
    dynamic hospitalDummyData = jsonDecode(dummyJson);
    HomeModel hospitalHomeModel = HomeModel(
        hospitalSectionModel: HospitalSectionModel.fromJson(hospitalDummyData),
        homeTypes: HomeTypes.hospital
    );
    int index = _getPositionFromModel(homeTypes);
    if (index > -1) {
      homeListModel.removeAt(index);
      homeListModel.insert(index, hospitalHomeModel);
    } else {
      homeListModel.insert(0, hospitalHomeModel);
    }
    notifyListeners();
  }

  int _getPositionFromModel(HomeTypes homeTypes) {
    for (var i = 0; i < homeListModel.length; i++) {
      if (homeListModel[i].homeTypes == homeTypes) {
        return i;
      }
    }
    return -1;
  }
}