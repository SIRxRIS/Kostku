import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login.dart'; // Pastikan file login.dart berada di folder yang sama

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordVisible = false; // Status untuk show/hide password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00112F), // Warna latar belakang navy
      body: Stack(
        children: [
          // Gambar latar belakang
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/background.png', // Pastikan gambar ini ada di folder assets
              fit: BoxFit.cover,
            ),
          ),
          // Teks "KostKu" dengan RichText
          Positioned(
            top: 200, // Jarak dari atas layar
            left: 0,
            right: 0,
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Kost",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF10D3FF),
                      ),
                    ),
                    TextSpan(
                      text: "Ku",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Konten utama
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 300),
                    // Kartu Pendaftaran
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // TextField untuk Email
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Email Address",
                              labelStyle: GoogleFonts.roboto(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // TextField untuk Password
                          TextField(
                            obscureText: !_isPasswordVisible, // Terkait status visibility
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: GoogleFonts.roboto(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // TextField untuk Nama Lengkap
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Full Name",
                              labelStyle: GoogleFonts.roboto(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Tombol Daftar
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00BFFF),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              "Sign Up",
                              style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // OR Divider
                          Text(
                            "Or",
                            style: GoogleFonts.roboto(color: Colors.grey, fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          // Tombol Media Sosial
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red),
                                iconSize: 30,
                              ),
                              const SizedBox(width: 20),
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                                iconSize: 30,
                              ),
                              const SizedBox(width: 20),
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.apple, color: Colors.black),
                                iconSize: 30,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Teks Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: GoogleFonts.roboto(color: Colors.white, fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigasi ke halaman login
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                          },
                          child: Text(
                            "Log In",
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF00BFFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
