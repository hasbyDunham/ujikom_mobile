import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileFView extends StatelessWidget {
  const ProfileFView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Fakultas'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle('Tentang Fakultas'),
            sectionText(
              'Fakultas Ushuluddin merupakan salah satu fakultas di UIN Sunan Gunung Djati Bandung yang bergerak dalam bidang ilmu keislaman seperti Tafsir, Hadis, Aqidah Filsafat, dan lain-lain.',
            ),
            const SizedBox(height: 20),

            sectionTitle('Sejarah'),
            sectionText(
              'Didirikan pada tahun 1968, Fakultas Ushuluddin berperan dalam mencetak lulusan yang unggul dalam bidang kajian keislaman klasik dan kontemporer.',
            ),
            const SizedBox(height: 20),

            sectionTitle('Visi'),
            sectionText(
              'Menjadi pusat pengkajian dan pengembangan ilmu Ushuluddin yang unggul dan kompetitif di tingkat nasional dan internasional.',
            ),
            const SizedBox(height: 20),

            sectionTitle('Misi'),
            sectionText(
              '1. Menyelenggarakan pendidikan Ushuluddin berbasis integrasi ilmu.\n'
              '2. Mengembangkan riset dalam bidang keislaman.\n'
              '3. Mengabdi kepada masyarakat melalui kajian Ushuluddin.',
            ),
            const SizedBox(height: 20),

            sectionTitle('Pimpinan Fakultas'),
            sectionText(
              'Dekan: Dr. Ahmad Hidayat, M.Ag\nWakil Dekan I: Dr. Nina Suryana, M.Ag\nWakil Dekan II: Dr. Rahmat Maulana, M.Ag',
            ),
            const SizedBox(height: 20),

            sectionTitle('Kontak'),
            sectionText(
              'Alamat: Jl. AH. Nasution No.105 Cibiru, Bandung\nEmail: info@ushuluddin.uinsgd.ac.id\nTelepon: (022) 7800525',
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.teal,
      ),
    );
  }

  Widget sectionText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        height: 1.5,
      ),
    );
  }
}
