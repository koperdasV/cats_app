import 'package:json_annotation/json_annotation.dart';

part 'cats.g.dart';

@JsonSerializable(explicitToJson: true)
class Cats {
  final String id;
  final String url;
  

  Cats({
    required this.id,
    required this.url,
  });

  factory Cats.fromJson(Map<String, dynamic> json) => _$CatsFromJson(json);
  Map<String, dynamic> toJson() => _$CatsToJson(this);
}
