import 'package:dio/dio.dart';
import 'package:predict/src/feature/auth/model/auth_interface.dart';
import '../../model/domain/user.dart';

class AuthRepository implements AuthInterface {
  final Dio _dio = Dio();

  @override
  Future<User> login(User user) async {
    final response =
        await _dio.post('https://api-pdm.herokuapp.com/api/login', data: {
      'email': user.email,
      'password': user.password,
    });
    if (response.statusCode == 200) {
      final token = response.headers.value('Authorization');
      final domain = User(
        email: user.email,
        fullName: '',
        password: user.email,
        token: token,
      );
      return Future.value(domain);
    } else {
      throw Exception("Email ou Senha Inválidos!");
    }
  }

  @override
  Future<User> register(User user) async {
    final response =
        await _dio.post('https://api-pdm.herokuapp.com/api/signup', data: {
      'email': user.email,
      'password': user.password,
    });
    if (response.statusCode == 200) {
      final token = response.headers.value('Authorization');
      final domain = User(
        email: user.email,
        fullName: user.fullName,
        password: user.password,
        token: token,
      );
      return Future.value(domain);
    } else {
      throw Exception("Erro ao se cadastrar insira seu e-mail!");
    }
  }

  @override
  Future<User> resetPassword(String email) async {
    final response =
        await _dio.post('https://api-pdm.herokuapp.com/api/forgotpass', data: {
      'email': email,
    });
    if (response.statusCode == 200) {
      final domain = User(email: email, fullName: '', password: '', token: ',');
      return Future.value(domain);
    } else {
      throw Exception("Email Inválido!");
    }
  }
}
