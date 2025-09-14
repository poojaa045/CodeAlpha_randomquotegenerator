import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layouts Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LayoutDemoPage(),
    );
  }
}

class LayoutDemoPage extends StatelessWidget {
  const LayoutDemoPage({super.key});

  // 🔹 Helper widget for Icon + Label with styling
  Widget buildIconBox(IconData icon, String label, Color iconColor) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.blueAccent , blurRadius: 4),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, size: 70, color: iconColor),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black87,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              label,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Row, Column & Icon Demo"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Example 1: Row with Icons
            const Text(
              "Row Example:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildIconBox(Icons.home, "Home", Colors.blue),
                buildIconBox(Icons.star, "Star", Colors.orange),
                buildIconBox(Icons.favorite, "Like", Colors.red),
              ],
            ),

            const Divider(height: 40),

            // Example 2: Column with Icons
            const Text(
              "Column Example:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildIconBox(Icons.phone, "Phone", Colors.green),
                const SizedBox(height: 20),
                buildIconBox(Icons.email, "Email", Colors.purple),
                const SizedBox(height: 20),
                buildIconBox(Icons.map, "Map", Colors.brown),
              ],
            ),

            const Divider(height: 40),

            // Example 3: Nested Row & Column
            const Text(
              "Nested Row & Column:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildIconBox(Icons.directions_car, "Car", Colors.blue),
                const SizedBox(width: 30),
                buildIconBox(Icons.train, "Train", Colors.orange),
                const SizedBox(width: 30),
                buildIconBox(Icons.flight, "Flight", Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
