import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:source_safe_project/Features/authentication/data/models/register_model.dart';
import 'package:source_safe_project/Features/dashboard/data/models/users_model/users_model.dart';
import 'package:source_safe_project/core/errors/failures.dart';

abstract class UserRepo {
  Future<Either<Failure, UsersModel>> getAllUsers(
      {required int id, String? search});
  Future<Either<Failure, RegisterModel>> addGroup({
    required String userId,
    required String groupName,
    required List<int> userIds,
  });
  Future<Either<Failure, RegisterModel>> uploadFile({
    required String name,
    required int groupId,
    required int userId,
    required Uint8List fileBytes,
    required String fileName,
  });
}
