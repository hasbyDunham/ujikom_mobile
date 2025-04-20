class SejarahModel {
  final int id;
  final String sejarah;

  SejarahModel({required this.id, required this.sejarah});

  factory SejarahModel.fromJson(Map<String, dynamic> json) {
    return SejarahModel(
      id: json['id'],
      sejarah: json['sejarah'],
    );
  }
}
