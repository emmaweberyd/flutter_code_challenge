import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_code_challenge/dice.dart';
import 'package:flutter_code_challenge/dice_form.dart';
import 'package:flutter_code_challenge/dice_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const SizedBox(width: 200, child: DiceForm()),
            const SizedBox(height: 30),
            Dice(values: context.watch<DiceProvider>().values, dieWidth: 100),
            const SizedBox(height: 30),
            if (context.watch<DiceProvider>().history.isNotEmpty) ...[
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Previous Rolls',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey.shade500),
                ),
                child: Dice(
                  values:
                      context.watch<DiceProvider>().history.reversed.toList(),
                  dieWidth: 60,
                  grey: true,
                ),
              ),
            ],
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
