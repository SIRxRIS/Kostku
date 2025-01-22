import 'package:flutter/material.dart';
import 'balas_page.dart'; // Tambahkan import ke halaman BalasPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan debug banner
      title: 'frontend_feedback',
      home: const HomePage(), // Halaman utama aplikasi
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _reviews = [
    'Lorem ipsum dolor sit amet consectetur. Magnis nulla lectus mauris enim fermentum arcu porttitor purus. Erat quis dolor turpis amet tempor vel.',
    'Lorem ipsum dolor sit amet consectetur. Magnis nulla lectus mauris enim fermentum arcu porttitor purus. Erat quis dolor turpis amet tempor vel.',
    'Lorem ipsum dolor sit amet consectetur. Magnis nulla lectus mauris enim fermentum arcu porttitor purus. Erat quis dolor turpis amet tempor vel.',
  ];

  final TextEditingController _reviewController = TextEditingController();

  void _addReview(String review) {
    setState(() {
      _reviews.add(review);
    });
    _reviewController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Ikon kembali
          onPressed: () {
            // Aksi kembali
            Navigator.pop(context);
          },
        ),
        title: const Text('Ulasan'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _reviews.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade300, // Garis tipis berwarna abu-abu
                  width: 1, // Ketebalan garis
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar profil
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(50), // Membuat gambar bulat
                    child: Image.asset(
                      'assets/images/profil.jpg', // Path gambar
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Muaffaq Roif',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _reviews[index],
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                // Navigasi ke halaman BalasPage
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BalasPage(),
                                  ),
                                );
                              },
                              child: const Text('Balas'),
                            ),
                            const SizedBox(width: 8),
                            OutlinedButton(
                              onPressed: () {
                                // Menampilkan dialog konfirmasi saat tombol "Blokir" dipencet
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                        'Blokir Muaffaq Roif',
                                        style: TextStyle(
                                          color: Colors
                                              .red, // Warna merah pada judul
                                        ),
                                      ),
                                      content: const Text(
                                          'Apakah anda yakin dengan ini?'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8), // Lebih tajam
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'Kembali',
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0,
                                                  0), // Warna hitam pada tombol Kembali
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Logika untuk memblokir dapat ditambahkan di sini
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'Lanjut',
                                            style: TextStyle(
                                              color: Colors
                                                  .red, // Warna merah pada tombol Lanjut
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text('Blokir'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Menampilkan dialog untuk menambahkan ulasan baru
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Tambahkan Ulasan'),
                content: TextField(
                  controller: _reviewController,
                  decoration: const InputDecoration(hintText: 'Tulis ulasan'),
                  maxLines: 3,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Batal'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_reviewController.text.isNotEmpty) {
                        _addReview(_reviewController.text);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Kirim'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),  
    );
  }
}
 