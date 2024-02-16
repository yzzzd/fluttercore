import 'package:flutter_core/core.dart';
import 'package:flutter_core/utils/date_time_helper.dart';

part 'news.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class News {
  String? author;
  String? title;
  String? description;
  String? url;
  String? source;
  String? image;
  String? category;
  String? language;
  String? country;
  String? publishedAt;

  News(this.author, this.title, this.description, this.url, this.source, this.image, this.category, this.language, this.country, this.publishedAt);

  String get prettyPublishedAt => DateTimeHelper(locale: 'id_ID').convert(raw: publishedAt ?? '', destination: 'd MMMM yyyy, HH:mm');

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}