import 'package:home_spend/domain/entities/family_member.dart';

abstract class LoginRepository {
  Future<FamilyMember> familiMemberLogin();
}