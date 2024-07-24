// lib/features/auth/data/repositories/auth_repository_impl.dart
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> login(String username, String password) async {
    final userModel = await remoteDataSource.login(username, password);
    return User(
        username: userModel.username,
        token: userModel.token,
        roles: userModel.roles);
  }

  @override
  Future<User> register(String firstname, String lastname, String username,
      String password, String phonenumber, String email) async {
    final userModel = await remoteDataSource.register(
        firstname, lastname, username, password, phonenumber, email);
    return User(
        username: userModel.username,
        token: userModel.token,
        roles: userModel.roles);
  }
}
