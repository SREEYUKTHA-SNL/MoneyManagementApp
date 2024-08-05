
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
          child: Icon(icon, size: 30, color: Colors.black),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}
