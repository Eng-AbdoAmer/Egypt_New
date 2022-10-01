import 'dart:convert';

List<ScienceModel> scienceModelFromJson(String str) => List<ScienceModel>.from(
    json.decode(str)['articles'].map((x) => ScienceModel.fromJson(x)));

class ScienceModel {
  String title;
  String? description;
  String? urlToImage;
  DateTime publishedAt;
  String url;

  ScienceModel(
      {required this.title,
      this.description,
      this.urlToImage,
      required this.publishedAt,
      required this.url}); 
 

  factory ScienceModel.fromJson(Map<String, dynamic> json) {
    return ScienceModel(
      title: json["title"],
      description: json["description"],
      urlToImage: json["urlToImage"],
      publishedAt: DateTime.parse(json["publishedAt"]),
      url: json["url"],
    );
  }
}
