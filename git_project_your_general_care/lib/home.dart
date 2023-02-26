import 'package:flutter/material.dart';
import 'package:yourgeneralcare/individual_disease.dart';
import 'common_disease.dart';
import 'disease_model.dart';
import 'disease_view.dart';
class HomePage extends StatelessWidget { HomePage({Key? key}) : super(key: key);
// final List<String> image =
// [
//     womenSpecialIcon,
//     cancerIcon,
//     tbIcon,
//     stomachAcheIcon,
//     asthmaIcon,
//     skinDiseaseIcon,
//     insomniaIcon,
//     anxietyIcon,
//     depressionIcon,
//     cancerIcon,
//     hairIcon,
//     anxietyIcon,
//     obesityIcon,
//     malnutritionIcon,
//     infectionIcon,

// ];
// final List<String> name =
// [
//   "Women's Special",
//   "Ear,Nose & Throat",
//   "Heart",
//   "Diabetes",
//   "Stomach",
//   "Asthma",
//   "Skin",
//   "Insomnia",
//   "Anxiety",
//   "Depression",
//   "Cancer",
//   "Hair",
//   "Anger Management",
//   "Obesity",
//   "Malnutrition",
//   "Infection"
//
// ];

@override
Widget build(BuildContext context) {
 return Scaffold(
  appBar: AppBar(
   title: Text("Ur General Care"),
   backgroundColor: Colors.purple,
  ),
  body: SafeArea(
   child:

   Container(
    color: Colors.purple.shade200,
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    child: GridView.builder(
        itemCount: diseaseList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // mainAxisExtent: 150,
            crossAxisSpacing: 0,

            mainAxisSpacing: 0),
        itemBuilder: (BuildContext context,int index){
         return GestureDetector(
             onTap: () {
               if(diseaseList[index].isIndividualDisease){
                 Navigator.push(context,
                     (MaterialPageRoute(builder: (BuildContext context) {
                       return IndividualDisease(title: diseaseList[index].name,);
                     })));

               }else{
                 Navigator.push(context,
                     (MaterialPageRoute(builder: (BuildContext context) {
                       return CommonDisease();
                     })));
               }


             },
             child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               // Align(
               //  alignment: Alignment.center,
               //  child: CircleAvatar(
               //   backgroundImage: AssetImage(image[index],),
               //   radius: 60,
               //   // child: Image.asset(image[index]),
               //  ),
               // ),
                Container(
                  height: 90,
                  width: 90,
                  // padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white
                    
                  ),
                  child: Image.asset(diseaseList[index].image,scale: 7,),
                ),
               SizedBox(height: 5),
               Text(diseaseList[index].name,style: TextStyle(color: Colors.black),)
              ],
             )
         );
        }),
   ),

  ),
 );
}
}