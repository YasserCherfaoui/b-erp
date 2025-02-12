
import 'package:b_erp/models/job.dart';

class Person {
  // Attributes
  int personID;
  String name;
  Job? job;
  DateTime dateOfBirth;

  // Constructor
  Person({
    required this.personID,
    required this.name,
    required this.dateOfBirth,
  });

  // Method
  updateJob(Job job) {
    this.job = job;
  }

  @override
  String toString() {
    return "$name ${dateOfBirth.year}";
  }
}