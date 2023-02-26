class FirebaseDiseaseModel {
  String? causes;
  String? counsultDoctor;
  String? diseaseId;
  String? diseaseName;
  String? img1;
  String? img2;
  bool isIndividualDisease;
  String? remedies;
  String? symptoms;
  String? dos;
  String? donts;
  String? exercise;
  String? diet;



  FirebaseDiseaseModel(
      this.causes,
      this.counsultDoctor,
      this.diseaseId,
      this.diseaseName,
      this.img1,
      this.img2,
      this.isIndividualDisease,
      this.remedies,
      this.symptoms,
      this.dos,
      this.donts,
      this.exercise,
      this.diet
      );

  factory FirebaseDiseaseModel.fromJson(dynamic json) => FirebaseDiseaseModel(
      json["causes"]??'Causes',
      json["consult_doctor"]??'',
      json["disease_id"]as String??'',
      json["disease_name"]??'',
      json["img1"]??'',
      json["img2"]??'',
      json["isIndividualDisease"] as bool,
      json["remedies"]??'',
      json["symptoms"]??'',
      json["dos"]??'',
      json["donts"]??'',
      json["exercise"]??'',
      json["diet"]??'');
}