import 'package:flutter/material.dart';

class Die extends StatelessWidget {
  const Die({
    super.key,
    required this.number,
    this.width,
    this.grey = false,
  });

  final int number;
  final double? width;
  final bool grey;

  @override
  Widget build(BuildContext context) {
    var fileName = 'lib/assets/die$number.png';
    if (grey) fileName = 'lib/assets/die${number}grey.png';
    return Image.asset(fileName, width: width);
  }
}
