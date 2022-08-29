part of 'places_model.dart';

PlacesApiModel placesModelFromJson(Map<String, dynamic> json){
      return PlacesApiModel(
            name: json["name"],
            type: json["type"],
            parent: Parent.fromJson(json["parent"]),

      );
}

Map<String, dynamic> placesModelToJson(PlacesApiModel instance)=><String , dynamic>{
      "name": instance.name,
      "type": instance.type,
      "parent": instance.parent.toJson(),

};



Parent parentModelFromJson(Map<String, dynamic> json){
      return Parent(
            id: json["id"],
            name: json["name"],
            type: json["type"],

      );
}

Map<String, dynamic> parentModelToJson(Parent instance)=><String , dynamic>{
      "id": instance.id,
      "name": instance.name,
      "type": instance.type,

};