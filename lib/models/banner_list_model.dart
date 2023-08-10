class BannerListModel {
  List<BannerModel>? bannerList;

  /* Constructor */
  BannerListModel({
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