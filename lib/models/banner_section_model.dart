class BannerSectionModel {
  List<BannerModel>? bannerList;

  /* Constructor */
  BannerSectionModel({
    this.bannerList
  });
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
}