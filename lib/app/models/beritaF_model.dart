class BeritaFModel {
  int? id;
  int? userId;
  String? judulBeritaF;
  String? deskripsiF;
  String? foto;
  int? flag;

  BeritaFModel({
    this.id,
    this.userId,
    this.judulBeritaF,
    this.deskripsiF,
    this.foto,
    this.flag,
  });

  factory BeritaFModel.fromJson(Map<String, dynamic> json) {
    return BeritaFModel(
      id: json['id'],
      userId: json['user_id'],
      judulBeritaF: json['judul_beritaF'],
      deskripsiF: json['deskripsiF']?.replaceAll(RegExp(r'<[^>]*>'), '') ?? 'Tidak ada deskripsi',
      foto: json['foto'],
      flag: json['flag'],
    );
  }
}
