import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_spend/domain/entities/family_member.dart';

class LoginController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final List<FamilyMemberRole> roles = [FamilyMemberRole(1, "Head"),FamilyMemberRole(2, "Earning Member"),FamilyMemberRole(3, "Member")];
  Rx<FamilyMemberRole?> selectedRole = null.obs; 

  void updateRoleSelection(String? roleTitle) {
    if(roleTitle != null) {
      FamilyMemberRole? role = roles.firstWhereOrNull((role) => role.title == roleTitle,);
      if(role != null) {
        selectedRole.value = role;
      }
    }
  }

  void signup({required String name, required String role, String? code}) {
    
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}