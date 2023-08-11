import 'package:valbury_coding_test/models/banner_section_model.dart';
import 'package:valbury_coding_test/models/hospital_section_model.dart';
import '../utils/home_types.dart';

class HomeModel {
  HospitalSectionModel? hospitalSectionModel;
  BannerSectionModel? bannerSectionModel;
  HomeTypes? homeTypes;

  /* Constructor */
  HomeModel({
    this.hospitalSectionModel,
    this.bannerSectionModel,
    this.homeTypes
  });

  bool isHospitalSectionInvalid() {
    return hospitalSectionModel == null ||
        hospitalSectionModel!.hospitalList == null ||
        hospitalSectionModel!.hospitalList!.isEmpty;
  }

  bool isBannerSectionInvalid() {
    return bannerSectionModel == null ||
        bannerSectionModel!.bannerList == null ||
        bannerSectionModel!.bannerList!.isEmpty;
  }
}