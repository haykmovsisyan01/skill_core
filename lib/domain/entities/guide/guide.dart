import 'package:freezed_annotation/freezed_annotation.dart';

part 'guide.freezed.dart';
part 'guide.g.dart';

@freezed
@JsonSerializable()
class GuideEntity with _$GuideEntity {
  final String title;
  final int id;
  final String author;
  final String content;

  GuideEntity({
    required this.title,
    required this.id,
    required this.author,
    required this.content,
  });

  factory GuideEntity.fromJson(Map<String, dynamic> json) =>
      _$GuideEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GuideEntityToJson(this);
}
