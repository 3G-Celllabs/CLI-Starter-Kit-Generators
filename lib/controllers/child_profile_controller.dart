import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/child_profile_model.dart';
import '../services/child_profile_service.dart';

class ChildProfileController extends GetxController {
  final ChildProfileService _childProfileService = ChildProfileService();

  // Observable list of child profiles
  var childProfiles = <ChildProfile>[].obs;

  // Observable for managing permissions
  var permissions = <String, List<String>>{}.obs; // Map of child ID to list of permissions

  // Method to add a new child profile
  Future<void> addChildProfile(ChildProfile profile) async {
    try {
      await _childProfileService.createProfile(profile);
      childProfiles.add(profile);
      Get.snackbar('Success', 'Child profile added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add child profile');
    }
  }

  // Method to fetch all child profiles
  Future<void> fetchChildProfiles() async {
    try {
      var profiles = await _childProfileService.fetchProfiles();
      childProfiles.assignAll(profiles);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch child profiles');
    }
  }

  // Method to manage permissions for a child profile
  void managePermissions(String childId, List<String> newPermissions) {
    permissions[childId] = newPermissions;
    Get.snackbar('Success', 'Permissions updated successfully');
  }

  // Method to revoke a specific permission
  void revokePermission(String childId, String permission) {
    permissions[childId]?.remove(permission);
    Get.snackbar('Success', 'Permission revoked successfully');
  }

  // Method to add a new permission
  void addPermission(String childId, String permission) {
    if (permissions[childId] == null) {
      permissions[childId] = [];
    }
    permissions[childId]?.add(permission);
    Get.snackbar('Success', 'Permission added successfully');
  }
}
