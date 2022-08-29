import 'package:json_annotation/json_annotation.dart';
part 'places_model.g.dart';

// ignore: deprecated_member_use
@JsonSerializable(nullable: false)


class PlacesApiModel {
  PlacesApiModel({
    required this.name,
    required this.type,
    required this.parent,

  });

  String name;
  String type;
  Parent parent;

  factory PlacesApiModel.fromJson(Map<String, dynamic> json) => placesModelFromJson(json);

  Map<String, dynamic> toJson() => placesModelToJson(this);


}

class Parent {
  Parent({
    required this.id,
    required this.name,
    required this.type,
  });

  String id;
  String name;
  String type;

  factory Parent.fromJson(Map<String, dynamic> json) => parentModelFromJson(json);

  Map<String, dynamic> toJson() => parentModelToJson(this);

}




