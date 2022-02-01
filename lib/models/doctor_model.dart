class Doctor {
  int? id;
  String hospital_name ;
  String? hospital_phone;
  String? speciality;
  String? domaine;
  String? ville;
  String? quartier;
  String? name;
  String surname;
  String phone;

  Doctor(
      {this.id,
      required this.hospital_name,
      this.hospital_phone,
      this.speciality,
      this.domaine,
      this.ville,
      this.quartier,
      this.name,
      required this.surname,
      required this.phone,
      });

//map json to doctor model

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      phone: json['phone'],
      hospital_name: json['hospital_name'],
      hospital_phone: json['hospital_phone'],
      speciality: json['speciality'],
      domaine: json['domaine'],
      ville: json['ville'],
      quartier: json['quartier'],
    );
  }
}
