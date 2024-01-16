import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;

  const StyledButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        overlayColor:
            MaterialStateProperty.all<Color>(Colors.blueGrey.shade200),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: const BorderSide(color: Colors.black),
          ),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Center(child: Text(label)),
      ),
    );
  }
}
