class SliderModel {
  int id;
  String title;
  String image;
  String language;

  SliderModel({
    required this.id,
    required this.title,
    required this.image,
    required this.language,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      language: json['language'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'language': language,
    };
  }
}
