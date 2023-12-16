class Users {
  String? id;
  String? fullName;
  String? email;

  Users({
    this.id,
    this.fullName,
    this.email,
  });

  Map<String,dynamic> toFirestore() {
    return {
      "id" : id,
      "name" : fullName,
      "email" : email,
    };

  }

  factory Users.fromFirestore(Map<String,dynamic> json) {
    return Users(
      id: json["id"],
      fullName : json["name"],
      email : json ["email"],

    );
  }
}