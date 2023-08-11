import 'filter_model.dart';

class HospitalSectionModel {
  String? title;
  List<FilterModel>? filterList;
  List<HospitalModel>? hospitalList;

  /* Constructor */
  HospitalSectionModel({
    this.title,
    this.filterList,
    this.hospitalList
  });
}

class HospitalModel {
  int? id;
  String? name;
  String? address;
  String? thumbnail;

  /* Constructor */
  HospitalModel({
    this.id,
    this.name,
    this.address,
    this.thumbnail
  });
}