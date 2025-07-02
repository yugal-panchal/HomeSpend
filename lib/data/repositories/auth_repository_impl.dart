import 'package:home_spend/domain/entities/family_member.dart';
import 'package:home_spend/domain/repositories/auth_repository.dart';

class ExpenseRepositoryImpl extends AuthRepository {
  @override
  Future<FamilyMember> familiMemberLogin() {
    // TODO: implement familiMemberLogin
    throw UnimplementedError();
  }
  
  @override
  Future<FamilyMember> familiMemberSignup(Map<String,dynamic> userData) async {
    try {

    } catch(e) {
      print("Error while signing up: $e");
    }
    return FamilyMember("0", "name", FamilyMemberRole(1, "title"));
  }
  
}