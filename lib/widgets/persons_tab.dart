import 'package:b_erp/models/person.dart';
import 'package:flutter/material.dart';

class PersonsTab extends StatelessWidget {
  final List<Person> persons;
  final void Function(int) onDeletePerson;
  const PersonsTab({super.key, required this.persons, required this.onDeletePerson});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Text(
            "People",
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(persons[index].toString()),
                  trailing: IconButton(
                    onPressed: () {
                      onDeletePerson(index);
                    },
                    icon: const Icon(Icons.cancel_outlined),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
