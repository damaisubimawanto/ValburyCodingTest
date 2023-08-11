import 'filter_model.dart';

class HospitalSectionModel {
  int? id;
  String? title;
  List<FilterModel>? filterList;
  List<HospitalModel>? hospitalList;

  /* Constructor */
  HospitalSectionModel({
    this.id,
    this.title,
    this.filterList,
    this.hospitalList
  });

  HospitalSectionModel.fromJson(Map<String, dynamic> json) {
    id = json['section_id'];
    title = json['section_name'];

    if (json['filter'] != null) {
      filterList = <FilterModel>[];
      json['filter'].forEach((v) {
        filterList!.add(FilterModel.fromJson(v));
      });
    }

    if (json['data'] != null) {
      hospitalList = <HospitalModel>[];
      json['data'].forEach((v) {
        hospitalList!.add(HospitalModel.fromJson(v));
      });
    }
  }
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

  HospitalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    thumbnail = json['thumbnail'];
  }
}