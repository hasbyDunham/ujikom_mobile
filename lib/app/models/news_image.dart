class NewsModel{
  final int id;
  final String title;
  final String description;
  final String image;
  final int flag;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.flag,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['judul_berita'] ?? 'Tanpa Judul',
      description: json['deskripsi']?.replaceAll(RegExp(r'<[^>]*>'), '') ?? 'Tidak ada deskripsi',
      image: json['foto'] ?? '',
      flag: json['flag'] ?? 0,
    );
  }
}
