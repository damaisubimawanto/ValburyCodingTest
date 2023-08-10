import 'package:valbury_coding_test/models/banner_list_model.dart';
import 'package:valbury_coding_test/models/hospital_list_model.dart';
import '../utils/home_types.dart';

class HomeModel {
  HospitalListModel? hospitalListModel;
  HospitalListModel? clinicListModel;
  BannerListModel? bannerListModel;
  HomeTypes? homeTypes;

  /* Constructor */
  HomeModel({
    this.hospitalListModel,
    this.clinicListModel,
    this.bannerListModel,
    this.homeTypes
  });
}