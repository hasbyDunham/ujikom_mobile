import 'package:flutter/material.dart';

class KontakView extends StatelessWidget {
  const KontakView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontak Fakultas'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hubungi Kami',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            infoTile(
              icon: Icons.location_on,
              title: 'Alamat',
              subtitle:
                  'Fakultas Ushuluddin, UIN Sunan Gunung Djati Bandung\nJl. A.H. Nasution No. 105, Bandung, Jawa Barat',
            ),
            const SizedBox(height: 12),
            infoTile(
              icon: Icons.phone,
              title: 'Telepon',
              subtitle: '(022) 7800525 ext. 2351',
            ),
            const SizedBox(height: 12),
            infoTile(
              icon: Icons.email,
              title: 'Email',
              subtitle: 'ushuluddin@uinsgd.ac.id',
            ),
            const SizedBox(height: 12),
            infoTile(
              icon: Icons.language,
              title: 'Website',
              subtitle: 'http://ushuluddin.uinsgd.ac.id/',
            ),
          ],
        ),
      ),
    );
  }

  Widget infoTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 28, color: Colors.teal),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

