class FamilyMember {
  String id;
  String name;
  FamilyMemberRole role;
  String? code;

  FamilyMember(this.id, this.name, this.role) {
    if (role.id != "1" && code == null) {
      throw ArgumentError("Please enter the code provided by your head of the family");
    }
  }
}

class FamilyMemberRole {
  String id;
  String title;

  FamilyMemberRole(this.id, this.title);
}
