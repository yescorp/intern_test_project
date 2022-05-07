class User{
  int id;
  String name;
  String surname;
  String avatar;

  User({required this.id, required this.name, required this.surname, required this.avatar });

  static User GetFromJson(Map<String, dynamic> json){
    return User(id: json["id"], name: json["name"], surname: json["surname"], avatar: json["avatar"]);
  }
}