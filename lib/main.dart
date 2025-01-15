import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // Changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Back Button and Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 48), // Placeholder for symmetry
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Profile Picture
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Name and Role
                  const Text(
                    'Muaffaq Ro\'if',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Customer',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.email, color: Colors.white),
                      ),
                      Container(
                        height: 40,
                        width: 1,
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.phone, color: Colors.white),
                      ),
                      Container(
                        height: 40,
                        width: 1,
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.star, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Contact Section
                    const Text(
                      'Kontak',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    Row(
                      children: const [
                        Icon(Icons.email, color: Colors.blue),
                        SizedBox(width: 10),
                        Text('hilalabiyurahman@gmail.com'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.phone, color: Colors.blue),
                        SizedBox(width: 10),
                        Text('+62 815-2575-2140'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Other Section
                    const Text(
                      'Lainnya',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const ListTile(
                      leading: Icon(Icons.favorite, color: Colors.blue),
                      title: Text('Favorit'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.payment, color: Colors.blue),
                      title: Text('Pembayaran'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.support_agent, color: Colors.blue),
                      title: Text('Customer care'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.settings, color: Colors.blue),
                      title: Text('Setelan'),
                    ),
                    const Spacer(),
                    // Footer
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.logout, color: Colors.red),
                          label: const Text(
                            'Log out',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Ganti Akun',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        'Versi 12.22',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileScreen(),
  ));
}
