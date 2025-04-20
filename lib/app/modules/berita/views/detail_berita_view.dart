import 'package:flutter/material.dart';
import 'package:ujikom_mobile/app/models/berita_model.dart';

class DetailBeritaView extends StatelessWidget {
  final BeritaModel berita;

  const DetailBeritaView({Key? key, required this.berita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Berita'),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: const Color(0xFFF7F6F9), // Warna soft background
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar berita
                if (berita.foto.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      berita.foto,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: const Icon(Icons.broken_image, size: 60, color: Colors.grey),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),

                // Judul
                Text(
                  berita.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 16),

                // Deskripsi
                Text(
                  berita.description,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
