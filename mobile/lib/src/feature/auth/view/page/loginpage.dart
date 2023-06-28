import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../model/domain/user.dart';
import '../../view_model/auth_viewmodel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Modular.get<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              child: Text('Login'),
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;
                viewModel.login(
                    User(
                        email: email,
                        fullName: '',
                        password: password,
                        token: ','),
                    context);
              },
            ),
            SizedBox(height: 16.0),
            TextButton(
              child: Text('forgot_password'.i18n()),
              onPressed: () {
                Modular.to.pushNamed('/auth/forgotpass');
              },
            ),
            SizedBox(height: 16.0),
            TextButton(
              child: Text('signup'.i18n()),
              onPressed: () {
                Modular.to.pushNamed('/auth/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
