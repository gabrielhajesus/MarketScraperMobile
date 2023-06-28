import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../model/auth_usecase.dart';
import '../model/domain/user.dart';

class AuthViewModel {
  final AuthUseCase _authUseCase;

  AuthViewModel(this._authUseCase);

  Future<void> login(User user, BuildContext context) async {
    try {
      await _authUseCase.login(user);
      Modular.to.pushReplacementNamed('/home');
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro de login'),
            content: Text(
                'Ocorreu um erro durante o login. Verifique suas credenciais e tente novamente.'),
            actions: [
              ElevatedButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> register(User user, BuildContext context) async {
    try {
      await _authUseCase.register(user);
      Modular.to.pushReplacementNamed('/auth/login');
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro de registro'),
            content: Text(
                'Ocorreu um erro durante o registro. Verifique seus dados e tente novamente.'),
            actions: [
              ElevatedButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await _authUseCase.resetPassword(email);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Recuperação de senha'),
            content: Text(
                'Um email com as instruções para redefinir sua senha foi enviado para o seu endereço de email.'),
            actions: [
              ElevatedButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro de recuperação de senha'),
            content: Text(
                'Ocorreu um erro durante a recuperação de senha. Verifique seu endereço de email e tente novamente.'),
            actions: [
              ElevatedButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
