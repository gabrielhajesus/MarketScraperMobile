import 'domain/user.dart';

abstract class AuthInterface {
  Future<User> login(User user);

  Future<User> register(User user);

  Future<User> resetPassword(String email);
}
