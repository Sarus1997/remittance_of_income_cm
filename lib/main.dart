import 'package:flutter/material.dart';
import 'package:remittance_of_income_cm/screens/income_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year; // Get current year

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ROI CM',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'โปรแกรมนำส่งรายได้',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          backgroundColor: Colors.pinkAccent.shade200,
          elevation: 0,
        ),
        body: const Column(
          children: [
            Expanded(
              child: Center(
                child: IncomeReportPage(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.pinkAccent.shade100,
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          child: Text(
            '© $currentYear All rights reserved.',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
