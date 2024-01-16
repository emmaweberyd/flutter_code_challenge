import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:growable_text/growable_text.dart';
import 'package:provider/provider.dart';
import 'package:flutter_code_challenge/dice_provider.dart';
import 'package:flutter_code_challenge/styled_button.dart';

class DiceForm extends HookWidget {
  const DiceForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: '');

    final isFieldEmpty = useState<bool>(true);
    final nrOfDice = useState<int>(0);

    useEffect(() {
      controller.addListener(() {
        isFieldEmpty.value = controller.text.toString().isEmpty;
        nrOfDice.value = isFieldEmpty.value ? 0 : int.parse(controller.text);
      });
    }, [controller]);

    return Column(
      children: [
        const GrowableText(
          'Number of Dice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        StyledButton(
          onPressed: isFieldEmpty.value
              ? () {}
              : () => context.read<DiceProvider>().rollTheDice(nrOfDice.value),
          label: 'Roll',
        ),
      ],
    );
  }
}
