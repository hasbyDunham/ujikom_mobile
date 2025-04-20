class NewsModel{
  final int id;
  final String title;
  final String description;
  final String foto;
  final int flag;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.foto,
    required this.flag,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['judul_berita'] ?? 'Tanpa Judul',
      description: json['deskripsi']?.replaceAll(RegExp(r'<[^>]*>'), '') ?? 'Tidak ada deskripsi',
      foto: json['foto'] ?? '',
      flag: json['flag'] ?? 0,
    );
  }
}
