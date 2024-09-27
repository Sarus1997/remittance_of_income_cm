import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "ใบนำส่งรายได้/Income Report Carnival Magic",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text("Logo", style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
