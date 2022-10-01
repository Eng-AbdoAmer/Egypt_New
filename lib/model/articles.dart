import 'dart:convert';

List<Articles> articlesFromJson(String str) => List<Articles>.from(
    json.decode(str)['articles'].map((x) => Articles.fromJson(x)));

class Articles {
  String title;
  String? description;
  String? urlToImage;
  DateTime publishedAt;
  String url;

  Articles({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.url,
  });

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        title: json["title"],
        description: json["description"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        url: json["url"],
      );
}
