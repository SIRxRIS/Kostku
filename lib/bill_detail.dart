import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "method-payment.dart";

class BillDetail extends StatelessWidget {
  final String title;
  final String amount;
  final String imageUrl;

  const BillDetail({
    Key? key,
    required this.title,
    required this.amount,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Detail Tagihan',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header image with blue overlay
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF10D3FF).withOpacity(0.7),
                ),
              ),
            ),

            // Payment type selection
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bayar Online',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: 1,
                    height: 24,
                    color: Colors.grey,
                  ),
                  Text(
                    'Bayar Offline',
                    style: GoogleFonts.poppins(),
                  ),
                ],
              ),
            ),

            // Bill details content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tagihan',
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bulan Maret',
                          style: GoogleFonts.poppins(),
                        ),
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Jumlah Tagihan',
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFD9D9D9),
                      ),
                    ),
                    child: Text(
                      'IDR. 1.300.000',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: Text(
                      'Tagihan bulan Maret\nbelum dibayar',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Silakan pilih metode pembayaran di bawah ini. Jika mengalami kendala, hubungi layanan pelanggan kami.',
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jatuh Tempo : 31 Maret 2025',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentMethodPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF10D3FF),
                        ),
                        child: Text(
                          'Bayar',
                          style: GoogleFonts.poppins(),
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
  }
}
