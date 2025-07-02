import 'package:home_spend/data/models/family_member_model.dart';
import 'package:home_spend/domain/entities/family_member.dart';
import 'package:home_spend/domain/repositories/auth_repository.dart';

class UserAuth {
  final AuthRepository authRepository;

  UserAuth(this.authRepository);

  void signup(FamilyMember familyMember) async {
    Map<String,dynamic> userData = FamilyMemberModel.fromEntity(familyMember).toJson();
    authRepository.familiMemberSignup(userData);

  }
}