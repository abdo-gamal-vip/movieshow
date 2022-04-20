import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movieshow/constants.dart';
import 'package:movieshow/helper.dart';
import 'package:movieshow/providers/home_providers.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/best_movies.dart';
import '../widgets/top10wid.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: backgound,elevation: 0,title: Text("movies Show",style: TextStyle(color: Colors.white),),centerTitle: true,),
      backgroundColor: backgound,
    
    body: 
    SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text("Top 10 ",  style: TextStyle(fontSize: 18 , color: fontColor2),) ,
          ),
      
        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKqUG2baOfmJwu-vMCk7XgMyRzSgOsgbDwow&usqp=CAU",fit: BoxFit.cover,height: 20,width: 50,),
        ],
      ),
      SizedBox(
        height: size.height*0.3,
        child: provider.movieList.isEmpty? Center(child: CircularProgressIndicator(),) : CarouselSlider.builder(itemCount: provider.movieList.length, itemBuilder: (context,index,realIndex){
      return Top10Wid(size: size,img: provider.movieList[index].poster_path,rate: provider.movieList[index].vote_average,title: provider.movieList[index].title,);
        }, options: CarouselOptions(enableInfiniteScroll: false , enlargeCenterPage: true,autoPlayAnimationDuration:Duration(seconds: 1) )),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child:   Text("Best Movies views", style: TextStyle(fontSize: 20 , color: fontColor),),
      ), 
      SizedBox(
      height: size.height*0.3,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: provider.movieList2.length,
      itemBuilder: (context,index){
      return BestMovieWid(size: size,name: provider.movieList2[index].title,poster: provider.movieList2[index].poster_path,rate: provider.movieList2[index].vote_average
      ,len: provider.movieList2,);
        },
      ),
      
      
      
          
          ),
          SizedBox(
      height: size.height*0.3,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: provider.movieList2.length,
      itemBuilder: (context,index){
      return BestMovieWid(size: size,name: provider.movieList3[index].title,poster: provider.movieList3[index].poster_path,rate: provider.movieList3[index].vote_average
      ,len: provider.movieList3,);
        },
      )
        ),]),
      ),
    
    ),
  
  );
  }
}



