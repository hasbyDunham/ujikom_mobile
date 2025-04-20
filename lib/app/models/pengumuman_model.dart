class Pengumuman {
  int? id;
  int? userId;
  String? judulPengumuman;
  String? deskripsiPengumuman;
  String? foto;
  int? flag;

  Pengumuman({
    this.id,
    this.userId,
    this.judulPengumuman,
    this.deskripsiPengumuman,
    this.foto,
    this.flag,
  });

  factory Pengumuman.fromJson(Map<String, dynamic> json) {
    return Pengumuman(
      id: json['id'],
      userId: json['user_id'],
      judulPengumuman: json['judul_pengumuman'],
      deskripsiPengumuman: json['deskripsi_pengumuman'],
      foto: json['foto'],
      flag: json['flag'],
    );
  }

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
