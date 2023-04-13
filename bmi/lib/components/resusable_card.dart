import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  Cards({required this.color, this.cardChild, this.onCardTap});
  final Color color;
  final Widget? cardChild;
  final void Function()? onCardTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
