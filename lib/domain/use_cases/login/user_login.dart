import 'package:home_spend/domain/entities/family_member.dart';
import 'package:home_spend/domain/repositories/login_repository.dart';

class UserLogin {
  final LoginRepository loginRepository;

  UserLogin(this.loginRepository);

  void call(FamilyMember familyMember) async {
    
  }
}