import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../model/domain/user.dart';
import '../../view_model/auth_viewmodel.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Modular.get<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text('signup'.i18n())),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(labelText: 'fullname'.i18n()),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'email'.i18n()),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'password'.i18n()),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('signup'.i18n()),
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;
                final fullname = _fullNameController.text;
                viewModel.register(
                    User(
                        email: email,
                        fullName: fullname,
                        password: password,
                        token: ','),
                    context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
