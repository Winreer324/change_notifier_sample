import 'package:change_notifier_sample/auth_sample/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import '../widgets/login_form.dart';
import '../../model/user_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route<dynamic> get routeTo => MaterialPageRoute(
        builder: (BuildContext context) => const LoginPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginForm(
              onFormSaved: (UserModel user) => _onFormSaved(context, user),
            ),
          ],
        ),
      ),
    );
  }

  void _onFormSaved(BuildContext context, UserModel user) {
    Provider.of<UserService>(context, listen: false).setUser(user);
    Navigator.of(context).push(HomePage.routeTo(context));
  }
}
