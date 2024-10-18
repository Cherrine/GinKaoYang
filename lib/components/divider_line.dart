import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: Colors.grey, thickness: 1.0, endIndent: 10.0)),
        Text("OR", style: TextStyle(color: Colors.grey, fontSize: 14.0)),
        Expanded(child: Divider(color: Colors.grey, thickness: 1.0, indent: 10.0)),
      ],
    );
  }
}
