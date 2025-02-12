import 'package:b_erp/models/department.dart';
import 'package:flutter/material.dart';

class DepartmentsTab extends StatelessWidget {
  final Function(Department) handleRemoveDepartment;
  final List<Department> departments;
  const DepartmentsTab({super.key, required this.departments, required this.handleRemoveDepartment});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        children: [
          const Text(
            "Departments",
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: departments.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {},
                title: Text(departments[index].name),
                trailing: IconButton(
                  onPressed: () {
                    handleRemoveDepartment(departments[index]);
                  },
                  icon: const Icon(Icons.cancel_outlined),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
