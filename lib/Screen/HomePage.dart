import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotify/Data/songs_json.dart';
import 'package:spotify/Screen/Album.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activetap1 =0;
   int activetap2 =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppbar(),
      body: getbody(),
     
    );
    
  }
  Widget getAppbar(){
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Explore",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          Icon(Icons.menu)
        ],
      ),
    );
  }
  Widget getbody(){
return SingleChildScrollView(
child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    SingleChildScrollView(
     scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(top:28.0,left: 35),
            child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         Row(
             children: 
               List.generate(song_type_1.length, (index){
                return Padding(
                  padding: const EdgeInsets.only(right:38.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        activetap1 =index;
                      });
                    },
                       child: Column(
                         crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                     Text(song_type_1[index],style: TextStyle(color:activetap1==index?Colors.green: Colors.grey,
                     fontSize: 16,
                     fontWeight: FontWeight.w600
                     ),),
                     SizedBox(
                       height: 10,
                     ),
                     activetap1==index?
                     Container(
                       height: 2,
                       width: 10,
                       color: Colors.green,
                     ):Container()
                      ],
                    ),
                  ),
                );
               })
             
         )
        ],
      ),
          ),
    ),
 SizedBox(
height: 20,
 ),
     SingleChildScrollView(
       scrollDirection: Axis.horizontal,
            child: Padding(
         padding: const EdgeInsets.only(left:30),
         child: GestureDetector(
           onTap: (){
            
           },
    child: Row(
         children:List.generate(songs.length - 5, (index){
           return GestureDetector(
             onTap: (){
               Navigator.push(context, PageTransition(
               type: PageTransitionType.scale,
               alignment: Alignment.bottomCenter,
               child: Album(
                 songs[index]
               )
             ));
             },
                  child: Padding(
                    padding: const EdgeInsets.only(right:38.0),
                    child: Column(
              children: [
                Container(
                    height: 180,
                    width: 180,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       image:AssetImage(songs[index]["img"]),fit: BoxFit.cover
                     ),
                     color: Colors.green,
                     borderRadius: BorderRadius.circular(20)
                   ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  songs[index]["title"],style: TextStyle(color: Colors.white,
                  fontSize: 16
                  ),
                ),  SizedBox(
                  height: 10,
                ),
                  Container(
                    width: 180,
                    child: Text(
                    songs[index]["description"],
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style:
                     TextStyle(color: Colors.grey,
                    fontSize: 10
                    )),
                  ),
              ],
             ),
                  ),
           );
         })
   ),
 ),
       ),
     ),
     SizedBox(
       height: 20,
     ),
      SingleChildScrollView(
     scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(top:28.0,left: 35),
            child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         Row(
             children: 
               List.generate(song_type_2.length, (index){
                return Padding(
                  padding: const EdgeInsets.only(right:38.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        activetap2 =index;
                      });
                    },
                       child: Column(
                         crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                     Text(song_type_2[index],style: TextStyle(color:activetap2==index?Colors.green: Colors.grey,
                     fontSize: 16,
                     fontWeight: FontWeight.w600
                     ),),
                     SizedBox(
                       height: 10,
                     ),
                     activetap2==index?
                     Container(
                       height: 2,
                       width: 10,
                       color: Colors.green,
                     ):Container()
                      ],
                    ),
                  ),
                );
               })
             
         )
        ],
      ),
          ),
    ),
 SizedBox(
height: 20,
 ),
     SingleChildScrollView(
       scrollDirection: Axis.horizontal,
            child: Padding(
         padding: const EdgeInsets.only(left:30),
         child: GestureDetector(
           onTap: (){
             
           },
    child: Row(
         children:List.generate(songs.length - 5, (index){
           return GestureDetector(
             onTap: (){
               Navigator.push(context, PageTransition(
               type: PageTransitionType.scale,
               alignment: Alignment.bottomCenter,
               child: Album(
                 songs[index +5]
               )
             ));
             },
                  child: Padding(
                    padding: const EdgeInsets.only(right:38.0),
                    child: Column(
              children: [
                Container(
                    height: 180,
                    width: 180,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       image:AssetImage(songs[index+5]["img"]),fit: BoxFit.cover
                     ),
                     color: Colors.green,
                     borderRadius: BorderRadius.circular(20)
                   ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  songs[index + 5]["title"],style: TextStyle(color: Colors.white,
                  fontSize: 16
                  ),
                ),  SizedBox(
                  height: 10,
                ),
                  Container(
                    width: 180,
                    child: Text(
                    songs[index + 5]["description"],
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style:
                     TextStyle(color: Colors.grey,
                    fontSize: 10
                    )),
                  ),
              ],
             ),
                  ),
           );
         })
   ),
 ),
       ),
     )
  ],
),
);
  }
}