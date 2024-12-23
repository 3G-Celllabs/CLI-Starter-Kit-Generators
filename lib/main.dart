import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/child_profile/add_child_profile_screen.dart';
import 'screens/child_profile/child_profile_list_screen.dart';
import 'screens/child_profile/manage_permissions_screen.dart';
import 'screens/child_profile/share_profile_screen.dart';
import 'helpers/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Child Profile Manager',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      initialRoute: '/childProfileList',
      getPages: [
        GetPage(
          name: '/addChildProfile',
          page: () => AddChildProfileScreen(),
        ),
        GetPage(
          name: '/childProfileList',
          page: () => ChildProfileListScreen(),
        ),
        GetPage(
          name: '/managePermissions',
          page: () => ManagePermissionsScreen(),
        ),
        GetPage(
          name: '/shareProfile',
          page: () => ShareProfileScreen(),
        ),
      ],
    );
  }
}
