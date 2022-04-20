import 'package:flutter/material.dart';
import 'package:movieshow/constants.dart';
import 'package:movieshow/helper.dart';
class Top10Wid extends StatelessWidget {
  const Top10Wid({
    Key? key,
    required this.size,
required this.img,
required this.rate,
required this.title,
  }) : super(key: key);

  final Size size;
final String title;
final String img;
final double rate;

  @override
  Widget build(BuildContext context) {
    return     Stack(
    
      children: [
    
            Container(
    
        
    
          height: size.height*0.3,
    
        
    
          decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(20), image: DecorationImage(image: NetworkImage("http://image.tmdb.org/t/p/w600_and_h900_bestv2$img"),fit: BoxFit.fill),),
    
        
    
        ),
    
        Positioned(child: Container(
    
          height: size.height*0.0,
    
          width: size.width*0.35,
    
          decoration: BoxDecoration(color: primaryColor.withOpacity(0.8) ,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(35)), ),
    
          child: Padding(
    
            padding: const EdgeInsets.all(8.0),
    
            child: Center(child: Text(cuttitle(title),style: TextStyle(fontSize: 5,fontWeight: FontWeight.bold),)),
    
          )),
    
        bottom: 0,left: 0,),
    
         Positioned(child: Container(
    
          height: size.height*0.04,
    
          width: size.width*0.15,
    
          decoration: BoxDecoration(color: primaryColor.withOpacity(0.8) ,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(14)), ),
    
          child: Padding(
    
            padding: const EdgeInsets.all(8.0),
    
            child: Center(child: Text(rate.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
    
          )),
    
       top: 0, bottom: 150,right: 0,),
    
       Positioned(child: Container(child: Padding(
    
         padding: const EdgeInsets.all(4),
    
         child: rate.toString() == "8.5"?  
    
          Text("***",style: TextStyle(fontSize: 30 , color: Colors.cyanAccent),) : Text("****",style: TextStyle(fontSize: 30 , color: Colors.cyanAccent),),
    
       ),),top: 0,right: 0,)
    
      ],
    
    );
  }
}