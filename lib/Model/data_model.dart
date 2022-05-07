class DataModel {
  String? anime;
  String? character;
  String? quote;

  DataModel({this.anime, this.character, this.quote});

  DataModel.fromJson(dynamic json) {
    anime = json["anime"];
    character = json["character"];
    quote = json["quote"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["anime"] = anime;
    map["character"] = character;
    map["quote"] = quote;
    return map;
  }
}
