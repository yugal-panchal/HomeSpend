class FamilyMember {
  String id;
  String name;
  FamilyMemberRole role;
  String? code;

  FamilyMember(this.id, this.name, this.role) {
    if (role.id != 1 && code == null) {
      throw ArgumentError("Please enter the code provided by the head of your family");
    }
  }
}

class FamilyMemberRole {
  int id;
  String title;

  FamilyMemberRole(this.id, this.title);
}
