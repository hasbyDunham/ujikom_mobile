class BeritaF {
  int? id;
  int? userId;
  String? judulBeritaF;
  String? deskripsiF;
  String? foto;
  int? flag;

  BeritaF({
    this.id,
    this.userId,
    this.judulBeritaF,
    this.deskripsiF,
    this.foto,
    this.flag,
  });

  factory BeritaF.fromJson(Map<String, dynamic> json) {
    return BeritaF(
      id: json['id'],
      userId: json['user_id'],
      judulBeritaF: json['judul_beritaF'],
      deskripsiF: json['deskripsiF'],
      foto: json['foto'],
      flag: json['flag'],
    );
  }
}
