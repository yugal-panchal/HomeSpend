import 'package:home_spend/domain/entities/family_member.dart';

class FamilyMemberModel {
  String id;
  String name;
  String familyId;
  int roleId;
  String roleTitle;
  String phoneNumber;

  FamilyMemberModel({
    required this.id,
    required this.name,
    required this.familyId,
    required this.roleId,
    required this.roleTitle,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'familyId': familyId,
      'roleId': roleId,
      'roleTitle': roleTitle,
      'phoneNumber': phoneNumber,
    };
  }

  factory FamilyMemberModel.fromJson(String id, Map<String, dynamic> json) {
    return FamilyMemberModel(
      id: id,
      name: json['name'],
      familyId: json['familyId'],
      roleId: json['roleId'],
      roleTitle: json['roleTitle'],
      phoneNumber: json["phoneNumber"],
    );
  }

  factory FamilyMemberModel.emptyObject() {
    return FamilyMemberModel(
      id: "0",
      name: "",
      familyId: "",
      roleId: 0,
      roleTitle: "",
      phoneNumber: "",
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FamilyMemberModel &&
        other.id == id &&
        other.name == name &&
        other.familyId == familyId &&
        other.roleId == roleId &&
        other.roleTitle == roleTitle &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      familyId.hashCode ^
      roleId.hashCode ^
      roleTitle.hashCode ^
      phoneNumber.hashCode;

  copyWith({
    String? id,
    String? name,
    String? familyId,
    int? roleId,
    String? roleTitle,
    String? phoneNumber,
  }) {
    this.id = id ?? this.id;
    this.name = name ?? this.name;
    this.familyId = familyId ?? this.familyId;
    this.roleId = roleId ?? this.roleId;
    this.roleTitle = roleTitle ?? this.roleTitle;
    this.phoneNumber = phoneNumber ?? this.phoneNumber;
  }

  /// Convert entity → model
  factory FamilyMemberModel.fromEntity(FamilyMember user) {
    return FamilyMemberModel(
      id: user.id,
      name: user.name,
      familyId: "",
      roleId: user.role.id,
      roleTitle: user.role.title,
      phoneNumber: user.number,
    );
  }

  /// Convert model → entity
  FamilyMember toEntity() {
    return FamilyMember(
      id,
      name,
      FamilyMemberRole(roleId, roleTitle),
      phoneNumber,
    );
  }
}
