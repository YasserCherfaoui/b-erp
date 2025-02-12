import 'package:b_erp/extensions/datetime_extentions.dart';
import 'package:flutter/material.dart';

class AddPersonForm extends StatelessWidget {
  final Function(String, String) onAddPerson;
  const AddPersonForm({super.key, required this.onAddPerson});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController dateOfBirthController = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: dateOfBirthController,
          decoration: InputDecoration(
            labelText: 'Date of Birth',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () async {
                dateOfBirthController.text = (await showDatePicker(
                      context: context,
                      firstDate: DateTime.now()
                          .subtract(const Duration(days: 365 * 100)),
                      lastDate: DateTime.now(),
                      initialDate: DateTime.now(),
                    ))
                        ?.toNamedString() ??
                    "";
              },
              icon: const Icon(Icons.calendar_month),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(onPressed: () {}, child: const Text("Clear")),
            const SizedBox(
              width: 5,
            ),
            ElevatedButton(
              onPressed: () {
                onAddPerson(nameController.text, dateOfBirthController.text);
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            )
          ],
        )
      ],
    );
  }
}
