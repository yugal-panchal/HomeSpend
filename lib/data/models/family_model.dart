class FamilyModel {
  final String id;
  final String name;
  final String code;
  final int createdAt;
  final int updatedAt;

  FamilyModel({
    required this.id,
    required this.name,
    required this.code,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FamilyModel.fromMap(Map<String, dynamic> map) {
    return FamilyModel(
      id: map['id'],
      name: map['name'],
      code: map["code"],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  FamilyModel copyWith({
    String? id,
    String? name,
    int? createdAt,
    int? updatedAt,
    String? code,
  }) {
    return FamilyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
