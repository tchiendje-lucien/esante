
class Ordonnance {
  int? id;
  String? medicine;
  String? exam;
  //Doctor? doctor;

  Ordonnance({
    this.id,
    this.medicine,
    this.exam,
    //this.doctor
  
  });

//map json to doctor model

  factory Ordonnance.fromJson(Map<String, dynamic> json) {
    return Ordonnance(
      id: json['id'],
      medicine: json['medicine'],
      exam: json['exam'],
   
    );
  }
}
