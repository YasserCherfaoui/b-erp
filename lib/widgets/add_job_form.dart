import 'package:flutter/material.dart';

class AddJobForm extends StatelessWidget {
  final void Function(String, int) onSaveClicked;
  const AddJobForm({super.key, required this.onSaveClicked});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController salaryController = TextEditingController();
    return AlertDialog(
      title: const Text("Add new job"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: salaryController,
            decoration: const InputDecoration(
              labelText: "Salary",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        OutlinedButton(
          onPressed: () {},
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            onSaveClicked(
              nameController.text,
              int.parse(salaryController.text),
            );
            Navigator.of(context).pop();
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
