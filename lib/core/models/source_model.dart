class SourceModel {
  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  SourceModel({
    required this.status,
    required this.code,
    required this.message,
    required this.sources,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
        status: json["status"],
        code: json["code"] ?? "",
        message: json["message"] ?? "",
        sources: List<Source>.from(json["sources"].map(
          (element) => Source.fromJson(element),
        )));
  }
}

class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;

  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      url: json["url"],
      category: json["category"],
    );
  }
}
