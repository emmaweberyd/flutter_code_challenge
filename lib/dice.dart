import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/die.dart';

class Dice extends StatelessWidget {
  final List<int> values;
  final double? width;
  final double? dieWidth;
  final bool? grey;

  const Dice({
    super.key,
    required this.values,
    this.width = 300,
    this.dieWidth,
    this.grey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Wrap(
        children: values
            .map((n) => Die(number: n, width: dieWidth, grey: grey ?? false))
            .toList(),
      ),
    );
  }
}
