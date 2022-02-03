class User{
  int? id;
  String? name;
  String? surname;
  String? email;
  String? password;
  String? re_password;
  String? date_birth;
  int? phone;
  String? sexe;
  String? token;

  User({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.password,
    this.re_password,
    this.date_birth,
    this.sexe,
    this.phone,
    this.token,
});

//map json to doctor model

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["user"]['id'],
      name: json["user"]['name'],
      surname: json["user"]['surname'],
      phone: json["user"]['phone'],
      email: json["user"]['email'],
      password: json["user"]['password'],
      re_password: json["user"]['re_password'],
      sexe: json["user"]['sexe'],
      date_birth: json["user"]['date_birth'],
      token: json['token'],
    );
  }
}