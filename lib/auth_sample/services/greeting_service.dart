import 'package:change_notifier_sample/auth_sample/services/user_services.dart';

class GreetingService {
  final UserService _userService;

  GreetingService({required UserService userService}) : _userService = userService;

  String get greeting => "Hello, ${_userService.user?.username ?? 'N/A'}";
}
