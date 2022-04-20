import 'package:flutter/material.dart';
import 'package:movieshow/constants.dart';
 class Details extends StatefulWidget {
   const Details({ Key? key }) : super(key: key);
 
   @override
   State<Details> createState() => _DetailsState();
 }
 
 class _DetailsState extends State<Details> {
   @override
   Widget build(BuildContext context) {
    
     return Scaffold(
       appBar: AppBar(backgroundColor: backgound,elevation: 0,title: Text("movies",style: TextStyle(color: Colors.white),),centerTitle: true,),
      backgroundColor: backgound,
    
       body:Stack(
         children: [Container(
           
         )],
       ),
     );
   }
 }