import 'package:home_spend/domain/entities/family_member.dart';

abstract class AuthRepository {
  Future<FamilyMember> familiMemberLogin();
  Future<FamilyMember> familiMemberSignup(Map<String,dynamic> data);
}