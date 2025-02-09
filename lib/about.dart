import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFFAFAFA),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFD9D9D9),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // House Image and Sun
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/home.png',
                            height: 120,
                            width: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // About KostKu Title
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "About ",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "Kost",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const TextSpan(
                            text: "Ku",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const TextSpan(
                            text: ".",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "KostKu adalah aplikasi yang membantu penghuni kost dan pemilik kost dalam mengelola informasi pembayaran fasilitas, serta komunikasi terkait tempat tinggal. Dengan tampilan yang sederhana dan fitur yang lengkap, KostKu memberikan solusi terbaik bagi penghuni yang ingin kemudahan dalam mengakses informasi terkait tagihan dan bagi pemilik kost dalam mengelola penyewaan.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Main Features
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Fitur Utama",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildFeatureItem("Informasi Tagihan",
                            "Cek jumlah tagihan kost setiap bulan dengan detail yang transparan."),
                        _buildFeatureItem("Histori Pembayaran",
                            "Lihat riwayat pembayaran kost agar tidak ada tagihan yang terlewat."),
                        _buildFeatureItem("Pengingat Pembayaran",
                            "Notifikasi otomatis agar tidak lupa membayar tepat waktu."),
                        _buildFeatureItem("Layanan & Fasilitas",
                            "Informasi fasilitas yang tersedia di kost seperti WiFi, Listrik, dan lainnya."),
                        _buildFeatureItem("Komunikasi dengan Pemilik",
                            "Hubungi pemilik kost langsung melalui chat atau telepon."),
                        _buildFeatureItem("Laporan & Keluhan",
                            "Laporkan masalah seperti listrik mati atau kerusakan kamar dengan mudah."),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Benefits Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Manfaat Aplikasi KostKu",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Benefits for Tenants
                        _buildBenefitSection(
                          "Bagi Penghuni Kost",
                          [
                            "Kemudahan dalam mengecek tagihan bulanan.",
                            "Tidak perlu khawatir lupa membayar karena ada pengingat otomatis.",
                            "Bisa langsung melaporkan masalah tanpa harus mencari kontak pemilik.",
                          ],
                        ),

                        // Benefits for Owners
                        _buildBenefitSection(
                          "Bagi Pemilik Kost",
                          [
                            "Mengelola daftar penyewa dengan lebih rapi.",
                            "Mempermudah pencatatan pembayaran.",
                            "Menerima laporan keluhan dari penghuni dengan sistematis.",
                          ],
                        ),
                      ],
                    ),
                  ),

                  // About Developer Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tentang Pengembang",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.5,
                            ),
                            children: [
                              TextSpan(
                                text: "KostKu ",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    "dikembangkan oleh tim yang peduli dengan kebutuhan penghuni dan pemilik kost dalam mengelola tempat tinggal dengan lebih efisien. Kami terus melakukan pengembangan untuk memberikan fitur terbaik bagi pengguna.",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Contact Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hubungi Kami",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Jika ada pertanyaan, saran, atau kendala, jangan ragu untuk menghubungi kami melalui:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildContactItem(
                            Icons.email, "Gmail: support@kostku.com"),
                        _buildContactItem(FontAwesomeIcons.whatsapp,
                            "WhatsApp: +62 812-3456-7890"),
                        _buildContactItem(
                            Icons.language, "Website: www.kostku.com"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Thank You Message
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.5,
                            ),
                            children: [
                              const TextSpan(
                                  text: "Terima kasih telah menggunakan "),
                              TextSpan(
                                text: "KostKu",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              const TextSpan(
                                text:
                                    "! Semoga aplikasi ini membantu kehidupan kost Anda menjadi lebih nyaman dan teratur.",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitSection(String title, List<String> benefits) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        ...benefits
            .map((benefit) => Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          benefit,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.grey[600],
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
