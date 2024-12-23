import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/child_profile_model.dart';

class ChildProfileService {
  final String _baseUrl = 'https://api.example.com'; // Replace with actual base URL

  // Method to create a new child profile
  Future<void> createProfile(ChildProfile profile) async {
    final url = Uri.parse('$_baseUrl/child-profiles');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(profile.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create profile');
    }
  }

  // Method to fetch all child profiles
  Future<List<ChildProfile>> fetchProfiles() async {
    final url = Uri.parse('$_baseUrl/child-profiles');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ChildProfile.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch profiles');
    }
  }

  // Method to manage permissions for a child profile
  Future<void> updatePermissions(String childId, List<String> permissions) async {
    final url = Uri.parse('$_baseUrl/child-profiles/$childId/permissions');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'permissions': permissions}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update permissions');
    }
  }
}
