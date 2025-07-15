class FamilyModel {
  String id;
  String name;
  String code;
  int createdAt;
  int updatedAt;

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

  copyWith({
    String? id,
    String? name,
    int? createdAt,
    int? updatedAt,
    String? code,
  }) {
    this.id = id ?? this.id;
    this.code = code ?? this.code;
    this.name = name ?? this.name;
    this.createdAt = createdAt ?? this.createdAt;
    this.updatedAt = updatedAt ?? this.updatedAt;
  }
}
