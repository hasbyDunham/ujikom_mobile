class BeritaModel {
  final int id;
  final String title;
  final String description;
  final String foto;
  final int flag;
  final String? timestamp;

  BeritaModel({
    required this.id,
    required this.title,
    required this.description,
    required this.foto,
    required this.flag,
    required this.timestamp,
  });

  factory BeritaModel.fromJson(Map<String, dynamic> json) {
    return BeritaModel(
      id: json['id'],
      title: json['judul_berita']?.toString() ?? 'Tanpa Judul',
      description: json['deskripsi']?.replaceAll(RegExp(r'<[^>]*>'), '') ?? 'Tidak ada deskripsi',
      foto: json['foto']?.toString() ?? '',
      flag: json['flag'] ?? 0,
      timestamp: json['created_at']?.toString() ??
                 json['timestamp']?.toString() ??
                 'Tidak ada timestamp',
    );
  }
}


// import 'package:flutter/foundation.dart';

// class BeritaModel {
//   final int id;
//   final String title;
//   final String description;
//   final String foto;
//   final String flag;
//   final dynamic timestamp; // Ubah dari flag ke timestamp dan gunakan dynamic

//   BeritaModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.foto,
//     required this.flag,
//     required this.timestamp, // Ganti nama field menjadi lebih deskriptif
//   });

//   factory BeritaModel.fromJson(Map<String, dynamic> json) {
//     // Debug data mentah
//     if (kDebugMode) {
//       print('Raw JSON data: $json');
//     }

//     // Proses field tanggal dari berbagai kemungkinan field
//     dynamic dateValue;
//     if (json['created_at'] != null) {
//       dateValue = json['created_at']; // Coba ambil dari created_at
//     } else if (json['timestamp'] != null) {
//       dateValue = json['timestamp']; // Atau dari timestamp
//     } else {
//       dateValue = json['flag']; // Fallback ke flag jika ada
//     }

//     return BeritaModel(
//       id: json['id'] ?? 0,
//       title: json['judul_berita']?.toString() ?? 'Tanpa Judul',
//       description: json['deskripsi']?.toString().replaceAll(RegExp(r'<[^>]*>'), '') ?? 'Tidak ada deskripsi',
//       flag: json['flag'] ?? 0,
//       foto: _processImageUrl(json['foto']),
//       timestamp: dateValue, // Simpan nilai asli
//     );
//   }

//   static String _processImageUrl(dynamic imagePath) {
//     if (imagePath == null || imagePath.toString().isEmpty) return '';
//     final path = imagePath.toString();
//     if (path.startsWith('http')) return path;
//     return 'http://192.168.1.16:8000/${path.startsWith('/') ? path.substring(1) : path}';
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'title': title,
//         'description': description,
//         'foto': foto,
//         'flag': flag,
//         'timestamp': timestamp,
//       };
// }