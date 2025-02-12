import 'package:flutter/material.dart';

class AddDepartmentForm extends StatelessWidget {
  const AddDepartmentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text("Add new department"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Department Name",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
