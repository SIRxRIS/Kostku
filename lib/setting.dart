import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),
      body: ListView(
        children: [
          // Bagian Akun
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Akun',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text('Informasi akun Anda'),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profil'),
            onTap: () {
              // Navigasi ke halaman profil
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Keamanan'),
            onTap: () {
              // Navigasi ke halaman keamanan
            },
          ),

          // Bagian Preferensi
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Preferensi',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text('Atur preferensi aplikasi Anda'),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifikasi'),
            onTap: () {
              // Navigasi ke halaman notifikasi
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Bahasa'),
            onTap: () {
              // Navigasi ke halaman bahasa
            },
          ),

          // Bagian Lainnya
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Lainnya',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text('Informasi dan tindakan lainnya'),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Tentang Kami'),
            onTap: () {
              // Navigasi ke halaman tentang kami
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Keluar'),
            onTap: () {
              // Log out dari aplikasi
            },
          ),
        ],
      ),
    );
  }
}
