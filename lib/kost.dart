import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "feedback.dart";
import "chat.dart";

class KostDetailPage extends StatefulWidget {
  @override
  _KostDetailPageState createState() => _KostDetailPageState();
}

class _KostDetailPageState extends State<KostDetailPage> {
  bool isFavorite = false; // State variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Image
              Stack(
                children: [
                  Image.asset(
                    'assets/images/bg3.png',
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF00BFFF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                ],
              ),

              // Detail Section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        'Famac Kost',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Rp 4.000.000 per month',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Fasilitas',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('- Twin shower, Wi-Fi, Mini kitchen'),
                          Text('- Tv, Netflix, AC'),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Rules',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('- Lorem ipsum dolor sit amet consectetur.'),
                          Text('- Lorem ipsum dolor sit amet consectetur.'),
                          Text('- Lorem ipsum dolor sit amet consectetur.'),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Post',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Scrollable Photo Section
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Image.asset('assets/images/bg3.png',
                                width: 150, fit: BoxFit.cover),
                            SizedBox(width: 10),
                            Image.asset('assets/images/bg3.png',
                                width: 150, fit: BoxFit.cover),
                            SizedBox(width: 10),
                            Image.asset('assets/images/bg3.png',
                                width: 150, fit: BoxFit.cover),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Price',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Tombol Ulasan dan Favorite di Sudut Kanan Atas
          Positioned(
            top: 50,
            right: 20,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF00BFFF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.reviews, color: Colors.white),
                    onPressed: () {
                      // Aksi ketika tombol ulasan ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FeedbackPage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF00BFFF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons
                              .favorite_border, // Ubah ikon berdasarkan state
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite; // Toggle state
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // Tombol Chat di Sudut Bawah Kanan
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                // Aksi ketika tombol chat ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(),
                  ),
                );
              },
              child: Icon(
                Icons.chat,
                color: Colors.white,
              ),
              backgroundColor: const Color(0xFF00BFFF),
            ),
          ),
        ],
      ),
    );
  }
}
