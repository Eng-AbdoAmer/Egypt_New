import 'dart:convert';

List<ArticleSport> articlesFromJson(String str) => List<ArticleSport>.from(
    json.decode(str)['articles'].map((x) => ArticleSport.fromJson(x)));

class ArticleSport {
  String? title;
  String? description;
  String? urlToImage;
  DateTime? publishedAt;
  String url;

  ArticleSport(
      {required this.title,
      required this.description,
      required this.urlToImage,
      required this.publishedAt,
      required this.url});

  factory ArticleSport.fromJson(Map<String, dynamic> json) => ArticleSport(
        title: json["title"],
        description: json["description"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        url: json["url"],
      );
}
