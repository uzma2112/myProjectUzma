import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yourgeneralcare/firebase_disease_model.dart';
import 'package:yourgeneralcare/disease_view.dart';
class CommonDisease extends StatelessWidget {
  CommonDisease({Key? key}) : super(key: key);
 final StreamController<bool> isLoadingController = BehaviorSubject();
 final List<FirebaseDiseaseModel> diseaseList = [];
  @override
  Widget build(BuildContext context) {
    fetchDiseaseData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Common Diseases"),
        backgroundColor: Colors.purple,
      ),
      body:StreamBuilder<bool>(
          stream: isLoadingController.stream,
          builder: (context, snapshot) {
            return
              snapshot.data == true ?
              Center(child: CircularProgressIndicator()):
              Container(
                child:
                ListView.builder(
                  itemCount: diseaseList.length,
                  itemBuilder: (context,index){
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color:Colors.black))),
                      child: ExpansionTile(
                        expandedAlignment: Alignment.topLeft,
                        tilePadding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                        childrenPadding: EdgeInsets.zero,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(diseaseList[index].disease_name ?? "")

                          ],
                        ),
                        children: [
                          Container(
                            alignment: Alignment.topLeft,

                            padding: EdgeInsets.only(left: 35),
                              child:
                                DiseaseView()
                            //           "\n•	Numbness or tingling in the hands or feet."
                            //           "\n•	Areas of darkened skin, usually in the armpits and neck.",*/
                            //           style: TextStyle(
                            //               color:Colors.black,
                            //               height: 1.5,
                            //               fontSize: 15)),
                            //     ),
                            //     buildTitle("Causes:"),
                            //     Padding(padding: EdgeInsets.only(left: 20,top:10),
                            //       child:Text(diseaseList[index].causes,
                            //           //"•	Cells in muscle, fat and the liver become resistant to insulin."
                            //           //"\n Because these cells don't interact in a normal way with insulin, they don't take in enough sugar."
                            //           //"\n•	The pancreas is unable to produce enough insulin to manage blood sugar levels.",
                            //           style: TextStyle(
                            //               color:Colors.black,
                            //               height: 1.5,
                            //               fontSize: 15)),
                            //     ),
                            //     buildTitle("Remedies"),
                            //     Padding(padding: EdgeInsets.only(left: 20,top:10),
                            //       child:Text(diseaseList[index].remedies,
                            //           //"•	Eating healthy foods. Choose foods lower in fat and calories and higher in fiber. Focus on fruits, vegetables and whole grains."
                            //           //"\n•	Getting active. Aim for 150 or more minutes a week of moderate to vigorous aerobic activity, such as a brisk walk, bicycling, running or swimming."
                            //           //"\n•	Losing weight. Losing a modest amount of weight and keeping it off can delay the progression from prediabetes to type 2 diabetes. If you have prediabetes, losing 7% to 10% of your body weight can reduce the risk of diabetes."
                            //           //"\n•	Avoiding inactivity for long periods. Sitting still for long periods can increase your risk of type 2 diabetes. Try to get up every 30 minutes and move around for at least a few minutes.",
                            //           style: TextStyle(
                            //               color:Colors.black,
                            //               height: 1.5,
                            //               fontSize: 15)),
                            //     ),
                            //     buildTitle("Gestational Diabetes"),
                            //     Padding(padding: EdgeInsets.only(left: 20,top:10),
                            //       child:Text(
                            //           "Gestational diabetes (diabetes during pregnancy) usually doesn’t have any symptoms. If you’re pregnant, your doctor should test you for gestational diabetes between 24 and 28 weeks of pregnancy. If needed, you can make changes to protect your health and your baby’s health.",
                            //           style: TextStyle(
                            //               color:Colors.black,
                            //               height: 1.5,
                            //               fontSize: 15)),
                            //     ),
                            //     buildTitle("Symptoms"),
                            //     Padding(padding: EdgeInsets.only(left: 20,top:10),
                            //       child:Text(diseaseList[index].symptoms,
                            //           //"•	Most of the time, gestational diabetes doesn't cause noticeable signs or symptoms. Increased thirst and more-frequent urination are possible symptoms.",
                            //           style: TextStyle(
                            //               color:Colors.black,
                            //               height: 1.5,
                            //               fontSize: 15)),
                            //     ),
                            //     buildTitle("Causes"),
                            //     Padding(padding: EdgeInsets.only(left: 20,top:10),
                            //       child:Text(diseaseList[index].causes,
                            //           //"•	Researchers don't yet know why some women get gestational diabetes and others don't. Excess weight before pregnancy often plays a role.",
                            //           style: TextStyle(
                            //               color:Colors.black,
                            //               height: 1.5,
                            //               fontSize: 15)),
                            //     ),
                            //     buildTitle("Remedies"),
                            //     Padding(padding: EdgeInsets.only(left: 20,top:10),
                            //       child:Text(diseaseList[index].remedies,
                            //           //"•	Eating healthy foods. Choose foods lower in fat and calories and higher in fiber. Focus on fruits, vegetables and whole grains."
                            //           //"\n•	Getting active. Aim for 150 or more minutes a week of moderate to vigorous aerobic activity, such as a brisk walk, bicycling, running or swimming."
                            //           //"\n•	Losing weight. Losing a modest amount of weight and keeping it off can delay the progression from prediabetes to type 2 diabetes. If you have prediabetes, losing 7% to 10% of your body weight can reduce the risk of diabetes."
                            //           //"\n•	Avoiding inactivity for long periods. Sitting still for long periods can increase your risk of type 2 diabetes. Try to get up every 30 minutes and move around for at least a few minutes.",
                            //           style: TextStyle(
                            //               color:Colors.black,
                            //               height: 1.5,
                            //               fontSize: 15)),
                            //     ),
                            //     buildTitle("When to consult a doctor"),
                            //     Padding(padding: EdgeInsets.only(left: 20,top:10),
                            //       child:Text(diseaseList[index].counsult_doctor,
                            //           //"•	Eating healthy foods. Choose foods lower in fat and calories and higher in fiber. Focus on fruits, vegetables and whole grains."
                            //           //"\n•	Getting active. Aim for 150 or more minutes a week of moderate to vigorous aerobic activity, such as a brisk walk, bicycling, running or swimming."
                            //           //"\n•	Losing weight. Losing a modest amount of weight and keeping it off can delay the progression from prediabetes to type 2 diabetes. If you have prediabetes, losing 7% to 10% of your body weight can reduce the risk of diabetes."
                            //           //"\n•	Avoiding inactivity for long periods. Sitting still for long periods can increase your risk of type 2 diabetes. Try to get up every 30 minutes and move around for at least a few minutes.",
                            //           style: TextStyle(
                            //               color:Colors.black,
                            //               height: 1.5,
                            //               fontSize: 15)),
                            //     ),
                            //   ],
                            ),
                          ],
                      ),
                    );
                  },
                ),
              );
          }
      ) ,

    );
  }

  fetchDiseaseData() async {
    isLoadingController.add(true);


    CollectionReference collection = FirebaseFirestore.instance.collection("disease");
    QuerySnapshot disease = await collection.get();
    disease.docs.forEach((element) {
      FirebaseDiseaseModel singleModel  = FirebaseDiseaseModel.fromJson(element.data() as Map<dynamic,dynamic>);
      diseaseList.add(singleModel);
    });
    isLoadingController.add(false);

  }

}

Widget buildTitle(String title){
  return Padding(padding:const EdgeInsets.only(top:10),
    child: Text("$title:",
        style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
            fontSize: 18
        )),
  );
}