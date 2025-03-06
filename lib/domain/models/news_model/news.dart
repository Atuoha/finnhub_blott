import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  final String source;
  final int datetime;
  final String headline;
  final String summary;
  final int id;
  final String category;
  final String image;
  final String url;

  News({
    required this.source,
    required this.datetime,
    required this.headline,
    required this.summary,
    required this.id,
    required this.category,
    required this.image,
    required this.url,
  });

  factory News.initial() {
    return News(
      source: '',
      datetime: 0,
      headline: '',
      summary: '',
      id: 0,
      category: '',
      image: '',
      url: '',
    );
  }

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
