
import 'package:b_erp/models/job.dart';
import 'package:b_erp/models/person.dart';

class Department {
  String name;
  List<Person> members = [];
  Person headOfDepartment;
  List<Job> jobs = [];

  Department({
    required this.name,
    required this.headOfDepartment,
  });

  // Method
  addMember(Person member) {
    members.add(member);
  }

  addJob(Job job) {
    jobs.add(job);
  }

  replaceHeadOfDepartment(Person newHeadOfDepartment) {
    headOfDepartment = newHeadOfDepartment;
  }

  renameDepartment(String newDepartmentName) {
    name = newDepartmentName;
  }

  resignMember(int memberID) =>
      members.removeWhere((member) => member.personID == memberID);
  
}