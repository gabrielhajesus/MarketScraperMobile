import 'package:dio/dio.dart';

import '../../model/auth_interface.dart';
import '../../model/domain/user.dart';
import '../dto/user_dto.dart';

class AuthRepository implements IAuth {
  @override
  Future<User> login(User user) async {
    final dto = UserDto.fromDomain(user);
    final response = await Dio().post(
      'https://api-pdm.herokuapp.com/api/login',
      data: dto.toJson(),
    );
    if (response.statusCode == 200) {
      final token = response.headers.value('Authorization');
      final domain = User(user.email, null, token: token);
      return Future.value(domain);
    } else {
      throw Exception("Email ou Senha Inválidos!");
    }
  }

  Future<User> signup(User user) async {
    final dto = UserDto.fromDomain(user);
    final response = await Dio().post(
      'https://api-pdm.herokuapp.com/api/sigunp',
      data: dto.toJson(),
    );
    if (response.statusCode == 200) {
      final token = response.headers.value('Authorization');
      final domain = User(user.email, null, token: token);
      return Future.value(domain);
    } else {
      throw Exception("Erro ao se cadastrar insira seu e-mail!");
    }
  }

  Future<User> forgotpass(User user) async {
    final dto = UserDto.fromDomain(user);
    final response = await Dio().post(
      'https://api-pdm.herokuapp.com/api/forgotpass',
      data: dto.toJson(),
    );
    if (response.statusCode == 200) {
      final domain = User(user.email, null, token: null);
      return Future.value(domain);
    } else {
      throw Exception("Email Inválido!");
    }
  }
}
