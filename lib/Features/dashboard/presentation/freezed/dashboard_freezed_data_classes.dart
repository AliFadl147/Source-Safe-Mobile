import 'package:freezed_annotation/freezed_annotation.dart';
part 'dashboard_freezed_data_classes.freezed.dart';

@freezed
class CreateGroupObject with _$CreateGroupObject {
  factory CreateGroupObject(String groupName) =
      _CreateGroupObject;
}

@freezed
class AddFileObject with _$AddFileObject {
  factory AddFileObject(String fileName) =
      _AddFileObject;
}