import 'package:home_spend/domain/entities/family_member.dart';

class FamilyMemberModel {
  final String id;
  final String name;
  final String code;
  final int roleId;
  final String roleTitle;

  FamilyMemberModel({
    required this.id,
    required this.name,
    required this.code,
    required this.roleId,
    required this.roleTitle,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'roleId': roleId,
      'roleTitle': roleTitle,
    };
  }

  factory FamilyMemberModel.fromJson(String id, Map<String, dynamic> json) {
    return FamilyMemberModel(
      id: id,
      name: json['name'],
      code: json['code'],
      roleId: json['roleId'],
      roleTitle: json['roleTitle'],
    );
  }

  /// Convert entity → model
  factory FamilyMemberModel.fromEntity(FamilyMember user) {
    return FamilyMemberModel(
      id: user.id,
      name: user.name,
      code: user.code ?? "",
      roleId: user.role.id,
      roleTitle: user.role.title,
    );
  }

  /// Convert model → entity
  FamilyMember toEntity() {
    return FamilyMember(
      id,
      name,
      FamilyMemberRole(roleId, roleTitle),
      code: code,
    );
  }
}
