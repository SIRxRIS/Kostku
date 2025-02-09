import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile.dart';
import "bills.dart";
import "home.dart";
import 'package:intl/intl.dart'; // Import package intl

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'History',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: 3,
                itemBuilder: (context, index) {
                  // Generate a date for each item
                  DateTime now = DateTime.now();
                  DateTime paymentDate = now.subtract(
                      Duration(days: index)); // Contoh: kurangi beberapa hari
                  String formattedDate =
                      DateFormat('dd/MM/yyyy').format(paymentDate);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: HistoryCard(
                      title: 'The beach',
                      status: index == 0 ? 'berhasil' : 'gagal',
                      imageUrl: 'assets/images/bg1.png',
                      date: formattedDate, // Pass the formatted date
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: 2,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BillsPage()),
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
                icon: Icon(Icons.home_outlined, color: Colors.grey),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long, color: Colors.grey),
                label: 'Bills'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history, color: Colors.blue),
                label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, color: Colors.grey),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

// HistoryCard class remains unchanged
class HistoryCard extends StatelessWidget {
  final String title;
  final String status;
  final String imageUrl;
  final String date; // Add date parameter

  const HistoryCard({
    Key? key,
    required this.title,
    required this.status,
    required this.imageUrl,
    required this.date, // Initialize date
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              // Changed Row to Column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Added this to push date to the right
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      // Display the date
                      date,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Text(
                  // Display the status
                  'Pembayaran $status',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: status == 'berhasil' ? Colors.green : Colors.red,
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
