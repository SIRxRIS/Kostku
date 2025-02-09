import 'package:flutter/material.dart';
import "home.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HomeScreen(), // Pastikan ini sesuai dengan nama class di home.dart
              ),
            );
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SectionHeader(title: 'Baru'),
          NotificationItem(
            name: 'Muaffaq Roif',
            message:
                'Lorem ipsum dolor sit amet consectetur. Magnis nulla lectus mauris enim fermentum arcu porttitor purus.',
          ),
          NotificationItem(
            name: 'Muaffaq Roif',
            message:
                'Lorem ipsum dolor sit amet consectetur. Magnis nulla lectus mauris enim fermentum arcu porttitor purus.',
          ),
          NotificationItem(
            name: 'Muaffaq Roif',
            message:
                'Lorem ipsum dolor sit amet consectetur. Magnis nulla lectus mauris enim fermentum arcu porttitor purus.',
          ),
          SectionHeader(title: '2 Hari lalu'),
          NotificationItem(
            name: 'Muaffaq Roif',
            message:
                'Lorem ipsum dolor sit amet consectetur. Magnis nulla lectus mauris enim fermentum arcu porttitor purus.',
          ),
          NotificationItem(
            name: 'Muaffaq Roif',
            message:
                'Lorem ipsum dolor sit amet consectetur. Magnis nulla lectus mauris enim fermentum arcu porttitor purus.',
          ),
          NotificationItem(
            name: 'Muaffaq Roif',
            message:
                'Lorem ipsum dolor sit amet consectetur. Magnis nulla lectus mauris enim fermentum arcu porttitor purus.',
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String name;
  final String message;

  const NotificationItem({required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white, // Warna latar belakang putih
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Warna bayangan lebih terang
            blurRadius: 6.0,
            offset: Offset(0, 3), // Posisi bayangan
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar profil bulat
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Membuat gambar menjadi bulat
              color: Colors.grey[200],
            ),
            clipBehavior: Clip.hardEdge, // Agar gambar tetap dalam lingkaran
            child: Image.asset(
              'assets/images/profile.jpg', // Pastikan path ini benar
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
