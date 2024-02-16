import 'package:floor/floor.dart';
import 'package:flutter_core/core.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@Entity()
class User {
  @PrimaryKey(autoGenerate: false)
  @JsonKey(includeFromJson: false, includeToJson: false)
  int idb = 1;
  int? id;
  String? name;
  String? bio;

  User(this.id, this.name, this.bio);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}