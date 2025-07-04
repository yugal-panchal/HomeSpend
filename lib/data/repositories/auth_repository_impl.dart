import 'package:home_spend/data/services/firebase_firestore_service.dart';
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
      print("User Data => $userData");
      String docPath = await FirebaseFirestoreService().addUser(userData);
      print("Doc Path $docPath");
    } catch(e) {
      print("Error while signing up: $e");
    }
    return FamilyMember("0", "name", FamilyMemberRole(1, "title"));
  }
  
}