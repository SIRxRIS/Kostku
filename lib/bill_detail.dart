import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillDetailPage extends StatelessWidget {
  final String title;
  final String amount;
  final String imageUrl;

  const BillDetailPage({
    Key? key,
    required this.title,
    required this.amount,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tagihan'),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Tagihan
            Center(
              child: Image.network(
                imageUrl,
                height: 120,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image_not_supported,
                      size: 80, color: Colors.grey);
                },
              ),
            ),
            SizedBox(height: 16),

            // Nama Tagihan
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            // Jumlah Tagihan
            Text(
              'Jumlah Tagihan',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Bulan Maret',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              amount,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 24),

            // Status Pembayaran
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tagihan anda bulan ini lunas',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green.withOpacity(0.2),
                  child: Icon(Icons.check, color: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Tautan Lihat Nota
            GestureDetector(
              onTap: () {
                // Tambahkan aksi untuk melihat nota
              },
              child: Text(
                'Lihat nota',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // Handle WhatsApp sharing
                },
                child: Image.asset(
                  'assets/images/whatsapp.png',
                  height: 24,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error, color: Colors.red);
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle Gmail sharing
                },
                child: Image.asset(
                  'assets/images/gmail.png',
                  height: 24,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error, color: Colors.red);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle payment
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00D0FF),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Bayar',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
