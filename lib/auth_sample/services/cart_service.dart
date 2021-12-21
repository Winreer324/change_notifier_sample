import 'package:change_notifier_sample/auth_sample/model/user_model.dart';
import 'package:change_notifier_sample/auth_sample/services/user_services.dart';

import 'greeting_service.dart';

class CartService {
  final GreetingService _greetingService;
  final UserService _userService;

  CartService({
    required GreetingService greetingService,
    required UserService userService,
  })  : _greetingService = greetingService,
        _userService = userService;

  String get cartGreeting => _greetingService.greeting;

  UserModel? get user => _userService.user;
}
