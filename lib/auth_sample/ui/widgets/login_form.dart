import 'package:flutter/material.dart';

import '../../model/user_model.dart';

class LoginForm extends StatefulWidget {
  final Function(UserModel user) onFormSaved;

  const LoginForm({Key? key, required this.onFormSaved}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final GlobalKey<FormState> _formKey;

  late final TextEditingController _usernameTextEditingController;
  late final TextEditingController _passwordTextEditingController;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _usernameTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
              controller: _usernameTextEditingController,
              decoration: const InputDecoration(labelText: "Username"),
              validator: (value) => _validateFormField(value, "Username")),
          TextFormField(
              controller: _passwordTextEditingController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
              validator: (value) => _validateFormField(value, "Password")),
          ElevatedButton(
            onPressed: _onLoginPressed,
            child: const Text("Login"),
          )
        ],
      ),
    );
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onFormSaved(
        UserModel(
          username: _usernameTextEditingController.text,
        ),
      );
    }
  }

  String? _validateFormField(String? value, String fieldName) {
    if (value?.isEmpty ?? false) {
      return "$fieldName cannot be empty.";
    }

    return null;
  }

  @override
  void dispose() {
    _usernameTextEditingController.dispose();
    _passwordTextEditingController.dispose();

    super.dispose();
  }
}
