import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:predict/src/commom/form_text_field.dart';

import '../../view_model/auth_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPagePageState();
}

class _LoginPagePageState extends State<LoginPage> {
  late ColorScheme _colors;
  late ThemeData _theme;
  final store = Modular.get<AuthViewmodel>();

  final _logo = Hero(
    tag: 'hero',
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 150.0,
      child: Image.asset(
        'lib/assets/images/title.png',
      ),
    ),
  );

  Widget get _loadingIndicator => Visibility(
        visible: store.loading,
        child: const LinearProgressIndicator(
          backgroundColor: Colors.blueGrey,
        ),
      );

  Widget get _password => widget.createFormField(
        title: 'password'.i18n(),
        theme: _theme,
        keyboardType: TextInputType.text,
        obscureText: true,
        hint: 'password_hint'.i18n(),
        enabled: !store.loading,
        onChange: (value) => store.password = value,
      );

  Widget get _email => widget.createFormField(
        title: 'email'.i18n(),
        theme: _theme,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        hint: 'email_hint'.i18n(),
        enabled: !store.loading,
        onChange: (value) => store.email = value,
      );

  final _loginButton = Container(
    margin: const EdgeInsets.fromLTRB(30, 15, 30, 5),
    width: double.infinity,
    height: 56,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(201, 14, 2, 238)),
      ),
      onPressed: () async => {
        Modular.to.pushNamed('/home'),
      },
      child: Text('login'.i18n(), style: const TextStyle(color: Colors.white)),
    ),
  );

  final _forgotLabel = TextButton(
    child: Text(
      'forgot_password'.i18n(),
      style: const TextStyle(color: Colors.black54),
    ),
    onPressed: () async => {
      Modular.to.pushNamed('/auth/forgotpass'),
    },
  );

  final _signupLabel = TextButton(
    child: Text(
      'signup'.i18n(),
      style: TextStyle(color: Colors.black54),
    ),
    onPressed: () async => {
      Modular.to.pushNamed('/auth/signup'),
    },
  );

  Widget get _divider => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(
              child: Divider(
            thickness: 4,
            indent: 25,
            endIndent: 15,
            color: Colors.blue,
          )),
        ],
      );

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _colors = _theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text('login'.i18n())),
      body: Center(
        child: SingleChildScrollView(
          child: Observer(builder: (_) {
            return Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _logo,
                  _loadingIndicator,
                  const SizedBox(height: 5),
                  _email,
                  _password,
                  _loginButton,
                  _forgotLabel,
                  _divider,
                  _signupLabel,
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
