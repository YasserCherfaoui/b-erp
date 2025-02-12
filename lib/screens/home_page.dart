import 'package:b_erp/models/department.dart';
import 'package:b_erp/models/job.dart';
import 'package:b_erp/models/person.dart';
import 'package:b_erp/widgets/add_department_form.dart';
import 'package:b_erp/widgets/add_job_form.dart';
import 'package:b_erp/widgets/add_person_form.dart';
import 'package:b_erp/widgets/departments_tab.dart';
import 'package:b_erp/widgets/jobs_tab.dart';
import 'package:b_erp/widgets/persons_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Person> persons = [];
  List<Job> jobs = [];
  List<Department> departments = [];

  onAddJob(String jobName, int salary) {
    Job job = Job(name: jobName, salary: salary);
    setState(() {
      jobs.add(job);
    });
  }

  onRemoveJob(Job job) {
    setState(() {
      jobs.remove(job);
    });
  }

  onAddDepartment(Department d) {
    setState(() {
      departments.add(d);
    });
  }
  onRemoveDepartment(Department d) {
    setState(() {
      departments.remove(d);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business ERP'),
        centerTitle: false,
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: const Text("Add new person"),
                        content: AddPersonForm(
                          onAddPerson: (String name, String dateOfBirth) {
                            List<int> date = dateOfBirth
                                .split("-")
                                .map((e) => int.parse(e))
                                .toList();
                            setState(() {
                              persons.add(Person(
                                name: name,
                                dateOfBirth: DateTime(
                                  date[0],
                                  date[1],
                                  date[2],
                                ),
                                personID: persons.length,
                              ));
                            });
                          },
                        ),
                      ));
            },
            icon: const Icon(Icons.person_add),
            label: const Text("Add Person"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddJobForm(
                  onSaveClicked: onAddJob,
                ),
              );
            },
            label: const Text("Add Job"),
            icon: const Icon(Icons.work),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton.icon(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AddDepartmentForm(
                          onSaveClicked: onAddDepartment,
                        ));
              },
              label: const Text("Add Department"),
              icon: const Icon(Icons.apartment),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              )),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Row(
        children: [
          PersonsTab(
            persons: persons,
            onDeletePerson: (p0) {
              setState(() {
                persons.removeAt(p0);
              });
            },
          ),
          JobsTab(
            jobs: jobs,
            handleRemoveJob: onRemoveJob,
          ),
          DepartmentsTab(
            departments: departments,
            handleRemoveDepartment: onRemoveDepartment,
          ),
        ],
      ),
    );
  }
}
