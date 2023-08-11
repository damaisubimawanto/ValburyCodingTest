class FilterModel {
  int? id;
  String? name;

  /* Constructor */
  FilterModel({
    this.id,
    this.name
  });

  FilterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}