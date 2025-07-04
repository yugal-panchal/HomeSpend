import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_spend/domain/entities/family_member.dart';
import 'package:home_spend/domain/use_cases/auth/user_auth.dart';
import 'package:home_spend/utils/toast.dart';

class AuthController extends GetxController {
  final UserAuth userAuthUseCases = Get.find<UserAuth>();
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final List<FamilyMemberRole> roles = [
    FamilyMemberRole(1, "Head"),
    FamilyMemberRole(2, "Earning Member"),
    FamilyMemberRole(3, "Member"),
  ];
  Rx<FamilyMemberRole> selectedRole = Rx<FamilyMemberRole>(FamilyMemberRole(0, ""));

  void updateRoleSelection(String? roleTitle) {
    if (roleTitle != null) {
      FamilyMemberRole? role = roles.firstWhereOrNull(
        (role) => role.title == roleTitle,
      );
      if (role != null) {
        selectedRole.value = role;
      }
    }
  }

  void signup() {
    if(nameController.text == "") {
      CustomToast.showWarningToast("Please enter your name");
      return;
    }
    if(selectedRole.value.id == 0) {
      CustomToast.showWarningToast("Please select a role");
      return;
    }

    FamilyMember familyMember = FamilyMember("",nameController.text, selectedRole.value, code: codeController.text);

    userAuthUseCases.signup(familyMember);    
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
