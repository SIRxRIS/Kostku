import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bills.dart';
import 'history.dart';
import 'home.dart';
import "customer_service.dart";
import "setting.dart";

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with back button and title
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF00D0FF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 16),
                        Text(
                          'Profile',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    // Profile Picture and Name
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[300],
                          child: Icon(Icons.person,
                              size: 40, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Muaffaq Ro\'if',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Costumer',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Contact Section
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kontak',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 16),
                    ProfileMenuItem(
                      icon: Icons.email_outlined,
                      title: 'Email',
                      subtitle: 'mhdabyanfathan@gmail.com',
                      iconColor: Colors.blue,
                    ),
                    ProfileMenuItem(
                      icon: Icons.phone_outlined,
                      title: 'Nomor Ponsel',
                      subtitle: '+62 895-2575-2161',
                      iconColor: Colors.blue,
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Lainnya',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 16),
                    ProfileMenuItem(
                      icon: Icons.favorite_outline,
                      title: 'Favorit',
                      showChevron: true,
                      iconColor: Colors.blue,
                      onPressed: () {
                        // Handle favorite action
                      },
                    ),
                    ProfileMenuItem(
                      icon: Icons.payment_outlined,
                      title: 'Pembayaran',
                      showChevron: true,
                      iconColor: Colors.blue,
                      onPressed: () {
                        // Handle payment action
                      },
                    ),
                    ProfileMenuItem(
                      icon: Icons.headset_mic_outlined,
                      title: 'Customer Service',
                      showChevron: true,
                      iconColor: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomerServicePage()),
                        );
                      },
                    ),
                    ProfileMenuItem(
                      icon: Icons.settings_outlined,
                      title: 'Setting',
                      showChevron: true,
                      iconColor: Colors.blue,
                      onPressed: () {
                        // Handle setting action
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()),
                        );
                      },
                    ),
                    // Logout and Switch Account
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              // Handle logout
                            },
                            icon: Icon(Icons.logout, color: Colors.red),
                            label: Text(
                              'Log out',
                              style: GoogleFonts.poppins(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle account switch
                            },
                            child: Text(
                              'Ganti Akun >',
                              style: GoogleFonts.poppins(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Version info
                    Center(
                      child: Text(
                        'Versi 1.2.22',
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
          currentIndex: 3,
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
            } else if (index == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
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
                icon: Icon(Icons.history, color: Colors.grey),
                label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.blue), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool showChevron;
  final Color iconColor;
  final VoidCallback? onPressed;

  const ProfileMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.showChevron = false,
    required this.iconColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                ],
              ),
            ),
            if (showChevron) Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
