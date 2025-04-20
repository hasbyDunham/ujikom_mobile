class PengumumanModel {
  int? id;
  int? userId;
  String? judulPengumuman;
  String? deskripsiPengumuman;
  String? foto;
  int? flag;

  PengumumanModel({
    this.id,
    this.userId,
    this.judulPengumuman,
    this.deskripsiPengumuman,
    this.foto,
    this.flag,
  });

  factory PengumumanModel.fromJson(Map<String, dynamic> json) {
    return PengumumanModel(
      id: json['id'],
      userId: json['user_id'],
      judulPengumuman: json['judul_pengumuman'],
      // Membersihkan tag HTML dari deskripsi
      deskripsiPengumuman: json['deskripsi_pengumuman']?.replaceAll(RegExp(r'<[^>]*>'), '') ?? 'Tidak ada deskripsi',
      foto: json['foto'],
      flag: json['flag'],
    );
  }

  // Getter untuk URL gambar lengkap
  String get fullImageUrl =>
      'http://127.0.0.1:8000/storage/images/pengumuman/$foto';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'judul_pengumuman': judulPengumuman,
      'deskripsi_pengumuman': deskripsiPengumuman,
      'foto': foto,
      'flag': flag,
    };
  }
}
