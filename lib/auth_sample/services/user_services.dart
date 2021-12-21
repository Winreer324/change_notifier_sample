
import 'package:change_notifier_sample/auth_sample/model/user_model.dart';

class UserService {
  UserModel? _user;
  UserModel? get user => _user;

  void setUser(UserModel user) {
    _user = user;
  }
}
