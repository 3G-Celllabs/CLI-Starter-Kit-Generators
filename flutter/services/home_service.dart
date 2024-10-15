import 'dart:convert';

class HomeService {
  static Future<User> getUserData() async {
    var response = await HttpService().get(
      url: ApiRoutes.user,
    );

    return User.fromJson(jsonDecode(response.body));
  }
}
