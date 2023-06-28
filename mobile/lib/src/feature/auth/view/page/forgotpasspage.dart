import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import '../../view_model/auth_viewmodel.dart';

class ForgotPassPage extends StatefulWidget {
  @override
  _ForgotPassPageState createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Modular.get<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text('forgot_password'.i18n())),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'email_hint'.i18n()),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('forgot_password'.i18n()),
              onPressed: () {
                final email = _emailController.text;
                viewModel.resetPassword(email, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
