import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  final String first;
  final String second;

  const TextRow({super.key, required this.first, required this.second});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          first,
          style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold),
        ),
        Text(
          second,
          style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
