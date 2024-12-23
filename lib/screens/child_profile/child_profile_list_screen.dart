import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChildProfileListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> childProfiles = [
    {
      'name': 'John Doe',
      'age': 8,
      'progress': '5 milestones completed',
      'permissions': true,
    },
    {
      'name': 'Jane Smith',
      'age': 5,
      'progress': '3 milestones completed',
      'permissions': false,
    },
    // Add more child profiles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child Profile List'),
      ),
      body: ListView.builder(
        itemCount: childProfiles.length,
        itemBuilder: (context, index) {
          final profile = childProfiles[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(
                profile['permissions'] ? Icons.lock_open : Icons.lock,
                color: profile['permissions'] ? Colors.green : Colors.red,
              ),
              title: Text(profile['name']),
              subtitle: Text(
                  'Age: ${profile['age']} - ${profile['progress']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                      // Navigate to child profile details
                      Get.snackbar('Info', 'Viewing details for ${profile['name']}');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // Navigate to add child profile screen
                      Get.snackbar('Add', 'Adding a new child profile');
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add child profile screen
          Get.snackbar('Add Another Child', 'Navigating to add child screen');
        },
        child: Icon(Icons.add),
        tooltip: 'Add Another Child',
      ),
    );
  }
}
