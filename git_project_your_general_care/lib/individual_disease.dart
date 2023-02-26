import 'package:flutter/material.dart';
import 'package:yourgeneralcare/disease_view.dart';

class IndividualDisease extends StatelessWidget {


  String title;
   IndividualDisease({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: DiseaseView(),
      ),
    );
  }
}
