import 'package:b_erp/models/job.dart';
import 'package:flutter/material.dart';

class JobsTab extends StatelessWidget {
  final void Function(Job) handleRemoveJob;
  final List<Job> jobs;
  const JobsTab({super.key, required this.jobs, required this.handleRemoveJob});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Text(
            "Jobs",
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {},
                title: Text(jobs[index].name),
                subtitle: Text("${jobs[index].salary} DZD"),
                trailing: IconButton(
                  onPressed: () {
                    handleRemoveJob(jobs[index]);
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
