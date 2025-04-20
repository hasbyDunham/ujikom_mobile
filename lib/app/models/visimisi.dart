class VisiMisiModel {
  final String visi;
  final String misi;
  final String tujuan;

  VisiMisiModel({
    required this.visi,
    required this.misi,
    required this.tujuan,
  });

  factory VisiMisiModel.fromJson(Map<String, dynamic> json) {
    return VisiMisiModel(
      visi: json['visi'] ?? '',
      misi: json['misi'] ?? '',
      tujuan: json['tujuan'] ?? '',
    );
  }
}
