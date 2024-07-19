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
        id: userModel.id, username: userModel.username, token: userModel.token);
  }

  @override
  Future<User> register(String username, String password) async {
    final userModel = await remoteDataSource.register(username, password);
    return User(
        id: userModel.id, username: userModel.username, token: userModel.token);
  }
}
