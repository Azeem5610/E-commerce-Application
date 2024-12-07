class GetCategoriesModel {
  String? slug;
  String? name;
  String? url;

  GetCategoriesModel({this.slug, this.name, this.url});

  GetCategoriesModel.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
