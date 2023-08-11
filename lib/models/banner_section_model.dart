class BannerSectionModel {
  List<BannerModel>? bannerList;

  /* Constructor */
  BannerSectionModel({
    this.bannerList
  });

  BannerSectionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      bannerList = <BannerModel>[];
      json['data'].forEach((v) {
        bannerList!.add(BannerModel.fromJson(v));
      });
    }
  }
}

class BannerModel {
  int? id;
  String? title;
  String? thumbnail;

  /* Constructor */
  BannerModel({
    this.id,
    this.title,
    this.thumbnail
  });

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['name'];
    thumbnail = json['thumbnail'];
  }
}