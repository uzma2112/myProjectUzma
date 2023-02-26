import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yourgeneralcare/common_disease.dart';
import 'package:yourgeneralcare/firebase_disease_model.dart';

class DiseaseView extends StatelessWidget {
  DiseaseView({Key? key}) : super(key: key);
List<String> symptoms =[];
List<String> causes =[];
List<String> dos =[];
List<String> donts =[];
List<String> remedies =[];
List<String> consultDoctor =[];
FirebaseDiseaseModel? singleDisease;

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
      child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 25,right: 25),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTitle("Symptoms"),
                  const Padding(padding: EdgeInsets.only(left: 20,top:10),
                  child: Text(
      "•	wheezing, coughing and chest tightness becoming severe and constant."
      "\n•	being too breathless to eat, speak or sleep."
      "\n•	breathing faster."
      "\n•	a fast heartbeat."
      "\n•	drowsiness, confusion, exhaustion or dizziness."
      "\n•	blue lips or fingers."
      "\n•	fainting."
          "\n             "
          ,
      style: TextStyle(
      color:Colors.black,
                      height: 1.5,
                      fontSize: 15))),
          Image.network('https://medicdrive.org/wp-content/uploads/2020/06/asthma-symptoms.jpg'),
        buildTitle("Causes"),
        const Padding(padding: EdgeInsets.only(left: 20,top:10),
            child: Text(
                "•	Airborne allergens, such as pollen, dust mites, mold spores, pet dander or particles of cockroach waste."
                "\n•	Respiratory infections, such as the common cold."
            "\n•	Physical activity."
           "\n •	Cold air."
           "\n •	Air pollutants and irritants, such as smoke."
           "\n •	Certain medications, including beta blockers, aspirin, and nonsteroidal anti-inflammatory drugs, such as ibuprofen (Advil, Motrin IB, others) and naproxen sodium (Aleve)."
        "\n•	Strong emotions and stress.",
                style: TextStyle(
                color:Colors.black,
                height: 1.5,
                fontSize: 15)),
      ),
      buildTitle("Remedies"),
      Padding(padding: const EdgeInsets.only(left: 20,top:10),
      child: Text(
        singleDisease!.remedies??"",
      // "•	Dietary changes"
      // "\n•	Garlic"
      // "\n•	Ginger"
      // "\n•	Honey"
      // "\n•	Omega-3 oils"
      // "\n•	Caffeine"
      // "\n•	Yoga"
      // "\n•	Hypnotherapy"
      // "\n•	Mindfulness"
      // "\n•	Acupuncture",

      style: const TextStyle(
      color:Colors.black,
      height: 1.5,
      fontSize: 15)),
      ),
                Image.network('https://www.wellcurve.in/blog/wp-content/uploads/2022/04/Home-Remedies-for-Asthma-blog.jpg'),

      buildTitle("When to consult doctor"),
      const Padding(padding: EdgeInsets.only(left: 20,top:10),
      child: Text(
      "•	If you think you have asthma. If you have frequent coughing or wheezing that lasts more than a few days or any other signs or symptoms of asthma, see your doctor."
          "\n •	Treating asthma early may prevent long-term lung damage and help keep the condition from getting worse over time.",
      // "\n•	To monitor your asthma after diagnosis. If you know you have asthma, work with your doctor to keep it under control. Good long-term control helps you feel better from day to day and can prevent a life-threatening asthma attack."
      // "\n•	If your asthma symptoms get worse. Contact your doctor right away if your medication doesn't seem to ease your symptoms or if you need to use your quick-relief inhaler more often."
      // "\nDon't take more medication than prescribed without consulting your doctor first. Overusing asthma medication can cause side effects and may make your asthma worse."
      // "\n•	To review your treatment. Asthma often changes over time. Meet with your doctor regularly to discuss your symptoms and make any needed treatment adjustments.",

      style: TextStyle(
      color:Colors.black,
      height: 1.5,
      fontSize: 15)),
      ),
      ],
      ),


      ),
    );

    // );
  }
  fetchSingleDisease() async {
    FirebaseDiseaseModel? data = FirebaseDiseaseModel(
        causes as String?,
        consultDoctor as String?,
        diseaseId as String?,
        disease_name,
        img1,
        img2,
        isIndividualDisease,
        remedies,
        symptoms,
    diseaseName     donts,
        exercise,
        diet) ;
    singleDisease = data;
   CollectionReference collection = FirebaseFirestore.instance.collection("disease");
   // QuerySnapshot disease = await collection.
  }
}
