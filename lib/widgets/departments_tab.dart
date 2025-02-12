import 'package:flutter/material.dart';

class DepartmentsTab extends StatelessWidget {
  const DepartmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          Text(
            "Departments",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
