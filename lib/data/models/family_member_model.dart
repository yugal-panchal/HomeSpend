import 'package:home_spend/domain/entities/family_member.dart';

class FamilyMemberModel {
  final String id;
  final String name;
  final String familyId;
  final int roleId;
  final String roleTitle;

  FamilyMemberModel({
    required this.id,
    required this.name,
    required this.familyId,
    required this.roleId,
    required this.roleTitle,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'familyId': familyId,
      'roleId': roleId,
      'roleTitle': roleTitle,
    };
  }

  factory FamilyMemberModel.fromJson(String id, Map<String, dynamic> json) {
    return FamilyMemberModel(
      id: id,
      name: json['name'],
      familyId: json['familyId'],
      roleId: json['roleId'],
      roleTitle: json['roleTitle'],
    );
  }

  FamilyMemberModel copyWith({
    String? id,
    String? name,
    String? familyId,
    int? roleId,
    String? roleTitle,
  }) {
    return FamilyMemberModel(
      id: id ?? this.id,
      name: name ?? this.name,
      familyId: familyId ?? this.familyId,
      roleId: roleId ?? this.roleId,
      roleTitle: roleTitle ?? this.roleTitle,
    );
  }

  /// Convert entity → model
  factory FamilyMemberModel.fromEntity(FamilyMember user) {
    return FamilyMemberModel(
      id: user.id,
      name: user.name,
      familyId: "",
      roleId: user.role.id,
      roleTitle: user.role.title,
    );
  }

  /// Convert model → entity
  FamilyMember toEntity() {
    return FamilyMember(id, name, FamilyMemberRole(roleId, roleTitle));
  }
}
