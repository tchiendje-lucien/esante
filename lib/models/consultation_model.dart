
class Consultation {
  int? id;
  int weight;
  int? temperature;
  String? medical_background;
  String? problems;
  //Doctor? doctor;

  Consultation({
    this.id,
    required this.weight,
    this.temperature,
    this.medical_background,
    this.problems,
    //this.doctor
  
  });

//map json to doctor model

  factory Consultation.fromJson(Map<String, dynamic> json) {
    return Consultation(
      id: json['id'],
      weight: json['weight'],
      temperature: json['temperature'],
      medical_background: json['medical_background'],
      problems: json['problems'],
   
    );
  }
}
