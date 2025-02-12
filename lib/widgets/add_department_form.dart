import 'package:b_erp/models/department.dart';
import 'package:flutter/material.dart';

class AddDepartmentForm extends StatelessWidget {
  final void Function(Department) onSaveClicked;
  const AddDepartmentForm({super.key, required this.onSaveClicked});

  @override
  Widget build(BuildContext context) {
    TextEditingController departmentNameController = TextEditingController();
    return AlertDialog(
      title: const Text("Add new department"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: departmentNameController,
            decoration: const InputDecoration(
              labelText: "Department Name",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("cancel")),
        ElevatedButton(
            onPressed: () {
              Department newDepartment =
                  Department(name: departmentNameController.text);
              onSaveClicked(newDepartment);
              Navigator.pop(context);
            },
            child: const Text("save")),
      ],
    );
  }
}
