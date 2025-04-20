// ignore_for_file: unused_local_variable
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../berita/views/berita_view.dart';
// import '../../pengumuman/views/pengumuman_view.dart';
// import '../../beritaF/views/berita_f_view.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     BeritaView(),         // Index
//     PengumumanView(),     // Your Event
//     BeritaFView(),        // Profile (misalnya Berita Fakultas)
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFEF5F9),
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: _pages,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         backgroundColor: const Color(0xFFFCEFFF),
//         selectedItemColor: Colors.purple,
//         unselectedItemColor: Colors.black54,
//         selectedLabelStyle: GoogleFonts.roboto(fontWeight: FontWeight.w500),
//         unselectedLabelStyle: GoogleFonts.roboto(fontWeight: FontWeight.w400),
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Berita',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.event),
//             label: 'Pengumuman',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Berita Fakultas',
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:ujikom_mobile/app/modules/berita/views/berita_view.dart';
// import 'package:ujikom_mobile/app/modules/beritaF/views/berita_f_view.dart';
// // import 'package:ujikom_mobile/app/modules/kontak/views/kontak_view.dart';
// // import 'package:ujikom_mobile/app/modules/lokasi/views/lokasi_view.dart';
// import 'package:ujikom_mobile/app/modules/pengumuman/controllers/pengumuman_controller.dart';
// import 'package:ujikom_mobile/app/modules/pengumuman/views/detail_pengumuman_view.dart';
// import 'package:ujikom_mobile/app/modules/pengumuman/views/pengumuman_view.dart';
// // import 'package:ujikom_mobile/app/modules/profil/views/profil_view.dart';
// // import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// // import 'package:cached_network_image/cached_network_image.dart';

// class HomeView extends StatelessWidget {
//   HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Fakultas Ushuluddin",
//               style: GoogleFonts.poppins(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xFF2E7D32),
//             ),
//             ),
//             Text(
//               "Universitas Islam Negeri",
//               style: GoogleFonts.poppins(
//                 fontSize: 12,
//                 color: Colors.black54),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ---- Bagian Header dengan Gambar Lokal ----
//             Container(
//               height: 180,
//               width: double.infinity,
//               margin: const EdgeInsets.only(bottom: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 image: const DecorationImage(
//                   image: AssetImage('assets/logodoang.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.black.withOpacity(0.3),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Selamat Datang",
//                     style: GoogleFonts.poppins(
//                       fontSize: 24,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // ---- Section Pengumuman ----
//             Text(
//               "📢 Pengumuman Terbaru",
//               style: GoogleFonts.poppins(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: const Color(0xFF2E7D32),
//               ),
//             ),
//             const SizedBox(height: 12),
//             SizedBox(
//               height: 120,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 3, // Ganti dengan data asli
//                 itemBuilder: (context, index) {
//                   return Container(
//                     width: 200,
//                     margin: const EdgeInsets.only(right: 12),
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.2),
//                           blurRadius: 4,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Judul Pengumuman ${index + 1}",
//                           style: GoogleFonts.poppins(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const Spacer(),
//                         Text(
//                           "Selengkapnya",
//                           style: GoogleFonts.poppins(
//                             fontSize: 12,
//                             color: const Color(0xFF2E7D32),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 24),

//             // ---- Section Menu Utama ----
//             Text(
//               "🎓 Menu Utama",
//               style: GoogleFonts.poppins(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: const Color(0xFF2E7D32),
//               ),
//             ),
//             const SizedBox(height: 12),
//             GridView.count(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               crossAxisCount: 2,
//               mainAxisSpacing: 16,
//               crossAxisSpacing: 16,
//               childAspectRatio: 1.1,
//               children: [
//                 _buildMenuItem(Icons.article, "Berita"),
//                 _buildMenuItem(Icons.announcement, "Pengumuman"),
//                 _buildMenuItem(Icons.school, "Berita Fakultas"),
//                 _buildMenuItem(Icons.info, "Profil"),
//                 _buildMenuItem(Icons.phone, "Kontak"),
//                 _buildMenuItem(Icons.map, "Lokasi"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ---- Widget Menu Item ----
//   Widget _buildMenuItem(IconData icon, String label) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(8),
//       onTap: () {
//         // Tambahkan navigasi sesuai kebutuhan
//         if (label == "Berita") Get.to(() => BeritaView());
//         if (label == "Pengumuman") Get.to(() => PengumumanView());
//         if (label == "Berita Fakultas") Get.to(() => BeritaFView());
//         // if (label == "Profil") Get.to(() => ProfilView());
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               blurRadius: 6,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 30, color: const Color(0xFF2E7D32)),
//             const SizedBox(height: 8),
//             Text(
//               label,
//               style: GoogleFonts.poppins(fontSize: 12),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:ujikom_mobile/app/modules/berita/views/berita_view.dart';
import 'package:ujikom_mobile/app/modules/beritaF/views/berita_f_view.dart';
import 'package:ujikom_mobile/app/modules/kontak/views/kontak_view.dart';
import 'package:ujikom_mobile/app/modules/lokasi/views/lokasi_view.dart';
import 'package:ujikom_mobile/app/modules/pengumuman/controllers/pengumuman_controller.dart';
import 'package:ujikom_mobile/app/modules/pengumuman/views/detail_pengumuman_view.dart';
import 'package:ujikom_mobile/app/modules/pengumuman/views/pengumuman_view.dart';
// import 'package:ujikom_mobile/app/modules/profileF/views/profile_f_view.dart';
import 'package:ujikom_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final PengumumanController pengumumanController = Get.put(PengumumanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA4D4E4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Fakultas Ushuluddin",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF002B4D),
              ),
            ),
            Text(
              "Universitas Islam Negeri",
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- Bagian Header dengan Gambar Lokal ----
            Container(
              height: 180,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/logodoang.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Center(
                  child: Text(
                    "Selamat Datang",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // ---- Section Pengumuman ----
            Text(
              "📢 Pengumuman Terbaru",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF002B4D),
              ),
            ),
            const SizedBox(height: 12),
            Obx(() {
              if (pengumumanController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (pengumumanController.pengumumanList.isEmpty) {
                return const Text("Tidak ada pengumuman");
              }

              return SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pengumumanController.pengumumanList.length,
                  itemBuilder: (context, index) {
                    final pengumuman = pengumumanController.pengumumanList[index];
                    return Container(
                      width: 200,
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pengumuman.judulPengumuman ?? "Tanpa Judul",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () => Get.to(() => DetailPengumumanView(pengumuman: pengumuman)),
                            child: Text(
                              "Selengkapnya",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: const Color(0xFF007399),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 24),

            // ---- Section Menu Utama ----
            Text(
              "🎓 Menu Utama",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF007399),
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: [
                _buildMenuItem(Icons.article, "Berita"),
                _buildMenuItem(Icons.announcement, "Pengumuman"),
                _buildMenuItem(Icons.school, "Berita Fakultas"),
                _buildMenuItem(Icons.info, "Profil"),
                _buildMenuItem(Icons.phone, "Kontak"),
                _buildMenuItem(Icons.map, "Lokasi"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---- Widget Menu Item ----
  Widget _buildMenuItem(IconData icon, String label) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        
        if (label == "Berita") Get.to(() => BeritaView());
        if (label == "Pengumuman") Get.to(() => PengumumanView());
        if (label == "Berita Fakultas") Get.to(() => BeritaFView());
        if (label == "Profil") Get.toNamed(Routes.PROFILE_F);
        if (label == "Kontak") Get.to(() => KontakView());
        if (label == "Lokasi") Get.to(() => LokasiView());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: const Color(0xFF007399)),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.poppins(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
