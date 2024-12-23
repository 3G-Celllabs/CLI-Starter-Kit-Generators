import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShareProfileScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _permissionsController = TextEditingController();
  String _sharingOption = 'View Only';
  String _generatedLink = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _sharingOption,
                decoration: InputDecoration(labelText: 'Sharing Permissions'),
                items: ['View Only', 'View & Modify']
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    _sharingOption = value;
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Generate secure link or QR code
                    _generatedLink = 'https://securelink.com/profile/12345';
                    Get.snackbar('Link Generated', 'Secure link generated successfully');
                  }
                },
                child: Text('Generate Link'),
              ),
              SizedBox(height: 20),
              if (_generatedLink.isNotEmpty)
                Column(
                  children: [
                    Text('Secure Link: $_generatedLink'),
                    SizedBox(height: 20),
                    QrImage(
                      data: _generatedLink,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ],
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_generatedLink.isNotEmpty) {
                    // Share the generated link
                    Get.snackbar('Share', 'Profile shared successfully');
                  } else {
                    Get.snackbar('Error', 'Please generate a link first');
                  }
                },
                child: Text('Share'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
