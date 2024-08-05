import 'package:flutter/material.dart';
import 'package:ramees/screens/connectwallet.dart';

class TransactionItem extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String amount;
  final Color amountColor;
  final void Function()? onImageTap;
  final void Function()? onAmountTap;

  const TransactionItem({
    required this.image,
    required this.title,
    required this.date,
    required this.amount,
    required this.amountColor,
    this.onImageTap,
    this.onAmountTap, 
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: onImageTap,
        child: Container(
          child: Image.asset(image, height: 40),
        ),
      ),
      title: Text(title),
      subtitle: Text(date),
      trailing: GestureDetector(
        onTap: onAmountTap,
        child: Container(
          height: 40,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(255, 159, 218, 198).withOpacity(0.1),
          ),
          child: Center(
            child: Text(
              amount,
              style: TextStyle(
                fontSize: 15,
                color: amountColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
