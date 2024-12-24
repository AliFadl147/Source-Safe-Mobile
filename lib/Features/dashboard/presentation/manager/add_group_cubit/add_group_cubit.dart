import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/user_repo.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/check_box_and_validation_cubit/check_box_and_validation_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/get_all_users_cubit/get_all_users_cubit.dart';
import 'package:source_safe_project/core/utils/functions.dart';
part 'add_group_state.dart';

class AddGroupCubit extends Cubit<AddGroupState> {
  AddGroupCubit(this.userRepo) : super(AddGroupInitialState());

  static AddGroupCubit get(context) => BlocProvider.of(context);

  final UserRepo userRepo;

  bool isLoading = false;

  Future<void> addGroup(BuildContext context) async {
    isLoading = true;
    emit(AddGroupLoadingState());
    var result = await userRepo.addGroup(
      userId: userId,
      groupName:
          CheckBoxAndValidationCubit.get(context).createGroupObject.groupName,
      userIds: selectedindexes,
    );
    result.fold((failure) {
      isLoading = false;
      Navigator.pop(context);
      showSnackBar(
        context,
        customSnackBar(
          title: 'Error',
          message: failure.errMessage,
          contentType: ContentType.failure, // Assuming you have this defined
          color: Colors.red, // Optional: add a custom color if needed
        ),
      );
      emit(AddGroupFailureState(failure.errMessage));
    }, (data) {
      isLoading = false;
      Navigator.pop(context);
      showSnackBar(
        context,
        customSnackBar(
          title: 'Success',
          message: data.message!,
          contentType: ContentType.success, // Assuming you have this defined
          color: Colors.green, // Optional: add a custom color if needed
        ),
      );
      GetAllUsersCubit.get(context).getAllUsers(id: 2);
      emit(AddGroupSuccessState());
    });
  }
}
