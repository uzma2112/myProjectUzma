import 'package:yourgeneralcare/Image.dart';

class DiseaseModel{
  String id;
  String name;
  String image;
  bool isIndividualDisease;

  DiseaseModel(this.id, this.name, this.image, this.isIndividualDisease);
}

List<DiseaseModel> diseaseList = [
  DiseaseModel("1",  "Common Disease", commonDiseaseIcon,false),
  DiseaseModel("2",  "Women's Special", womenSpecialIcon,false),
  DiseaseModel("3",  "Ear,Nose & Throat", earNoseThroatIcon,false),
  DiseaseModel("4",  "Heart", cancerIcon,false),
  DiseaseModel("5",  "Diabetes", diabetesIcon,false),
  DiseaseModel("6",   "Tuberculosis", tbIcon,true),
  DiseaseModel("7",  "Stomach", stomachAcheIcon,false),
  DiseaseModel("8",  "Asthma", asthmaIcon,true),
  DiseaseModel("9",  "Skin", skinDiseaseIcon,false),
  DiseaseModel("10",  "Insomnia", insomniaIcon,false),
  DiseaseModel("11",  "Anxiety", anxietyIcon,true),
  DiseaseModel("12",  "Depression", depressionIcon,true),
  DiseaseModel("13",  "Cancer", cancerIcon,false),
  DiseaseModel("14",  "Hair", hairIcon,false),
  DiseaseModel("15",  "Anger Management", anxietyIcon,true),
  DiseaseModel("16",  "Obesity", obesityIcon,true),
  DiseaseModel("17",  "Malnutrition", malnutritionIcon,true),
  DiseaseModel("18",  "Infection", infectionIcon,false),
];

