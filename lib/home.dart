import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "notification.dart";
import 'profile.dart';
import "bills.dart";
import "history.dart";
import "kost.dart";
import "search.dart";

void main() {
  runApp(KostkuApp());
}

class KostkuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kostku App',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // Background Image
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bg1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Profile dan Notifikasi
                  Positioned(
                    top: 50,
                    right: 20,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationPage()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFF00D0FF),
                              shape: BoxShape.circle,
                            ),
                            child:
                                Icon(Icons.notifications, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Search Bar
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4)
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()),
                          );
                        },
                        readOnly:
                            true, // Membuat TextField bisa diklik tapi tidak bisa diinput
                        decoration: InputDecoration(
                          hintText: 'Telusuri KostKu...',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          suffixIcon:
                              Icon(Icons.filter_list, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // PROMO
                    sectionTitle('Promo', 'October-December period'),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 200, // Increased height
                      child: promoList(),
                    ),

                    // RECOMMENDATION
                    SizedBox(height: 24),
                    sectionTitle('Recommendation', 'Just for you'),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 200, // Increased height
                      child: promoList(),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          onTap: (index) {
            if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BillsPage()),
              );
            } else if (index == 2) {
              // Tambahkan kondisi untuk History
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
            } else if (index == 3) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            }
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.blue), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long, color: Colors.grey),
                label: 'Bills'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history, color: Colors.grey),
                label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.grey), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      clipBehavior: Clip.none, // Pastikan tidak ada elemen yang terpotong
      children: [
        // Background Gambar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 280,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // Konten yang bisa di-scroll
        Positioned(
          top: 250,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              // Tambahkan ini untuk menghindari overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // PROMO
                  sectionTitle('Promo', 'October-December period'),
                  SizedBox(height: 16),
                  promoList(),

                  // RECOMMENDATION
                  sectionTitle('Recommendation', 'Just for you'),
                  SizedBox(height: 16),
                  promoList(),

                  SizedBox(
                      height: 20), // Tambahkan ruang ekstra di bagian bawah
                ],
              ),
            ),
          ),
        ),

        // Search Bar
        Positioned(
          top: 200,
          left: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Telusuri KostKu...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: Icon(Icons.filter_list, color: Colors.grey),
              ),
            ),
          ),
        ),

        // Profile dan Notifikasi
        Positioned(
          top: 50,
          right: 20,
          child: Row(
            children: [
              // Ikon Notifikasi
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xFF00D0FF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.notifications, color: Colors.white),
                ),
              ),
              SizedBox(width: 10),

              // Gambar Profile
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ],
          ),
        ),
      ],
    ),

    // Bottom Navigation Bar
    bottomNavigationBar: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        onTap: (index) {
          if (index == 1) {
            // Index untuk tombol Tagihan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BillsPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long, color: Colors.grey),
              label: 'Bills'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history, color: Colors.grey), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.grey), label: 'Profile'),
        ],
      ),
    ),
  );
}

// Fungsi untuk membuat judul bagian
Widget sectionTitle(String title, String subtitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      SizedBox(height: 4),
      Text(
        subtitle,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
    ],
  );
}

// Fungsi untuk membuat daftar promo/rekomendasi
Widget promoList() {
  return SizedBox(
    height: 170,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to KostDetailPage when a promo is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KostDetailPage()),
            );
          },
          child: Container(
            width: 200,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    'assets/images/bg${index + 1}.png',
                    fit: BoxFit.cover,
                    height: 100,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hilal Kost ${index + 1}',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          SizedBox(width: 4),
                          Text(
                            'Rp 4. 000.000',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 16),
                          SizedBox(width: 4),
                          Text(
                            '9.${index}',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
