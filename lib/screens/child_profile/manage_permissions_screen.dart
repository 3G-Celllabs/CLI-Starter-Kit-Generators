import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagePermissionsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  String _accessLevel = 'View Only';

  final List<Map<String, String>> accessList = [
    {'name': 'Alice Johnson', 'email': 'alice@example.com', 'role': 'View Only'},
    {'name': 'Bob Smith', 'email': 'bob@example.com', 'role': 'View & Modify'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Permissions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: accessList.length,
                itemBuilder: (context, index) {
                  final access = accessList[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(access['name']!),
                      subtitle: Text('${access['email']} - ${access['role']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Handle edit access
                              Get.snackbar('Edit', 'Editing access for ${access['name']}');
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Handle revoke access
                              Get.snackbar('Revoke', 'Revoking access for ${access['name']}');
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email/Phone'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email or phone number';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: _accessLevel,
                    decoration: InputDecoration(labelText: 'Access Level'),
                    items: ['View Only', 'View & Modify']
                        .map((level) => DropdownMenuItem(
                              value: level,
                              child: Text(level),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        _accessLevel = value;
                      }
                    },
                  ),
                  TextFormField(
                    controller: _durationController,
                    decoration: InputDecoration(labelText: 'Duration (optional)'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle add access
                        Get.snackbar('Success', 'Access added successfully');
                      }
                    },
                    child: Text('Add Access'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
