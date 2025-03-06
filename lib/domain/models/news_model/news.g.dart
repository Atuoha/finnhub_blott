// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      source: json['source'] as String,
      datetime: (json['datetime'] as num).toInt(),
      headline: json['headline'] as String,
      summary: json['summary'] as String,
      id: (json['id'] as num).toInt(),
      category: json['category'] as String,
      image: json['image'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'source': instance.source,
      'datetime': instance.datetime,
      'headline': instance.headline,
      'summary': instance.summary,
      'id': instance.id,
      'category': instance.category,
      'image': instance.image,
      'url': instance.url,
    };
