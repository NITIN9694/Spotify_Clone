

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotify/Data/songs_json.dart';
import 'package:spotify/Screen/SongDetail.dart';

class Album extends StatefulWidget {
  final dynamic song;
  Album(
   this.song,);
  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
       body: getbody(),
    );
  }
  Widget getbody(){
   var size = MediaQuery.of(context).size;
   var songeAlbum =widget.song["songs"];
    return SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children:[ Column(
                children: [
                  Container(
           height: 240,
           decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage(widget.song["img"]),fit: BoxFit.cover),
           color: Colors.green
           ),
          ),
           SizedBox(
             height: 30,
           ),
           Padding(
             padding: const EdgeInsets.only(left:28.0,right: 28),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(widget.song["title"],style: TextStyle(color: Colors.white,
                 fontSize: 18,
                 fontWeight: FontWeight.bold
                 ),),

                    Container(
                      padding: EdgeInsets.only(top:8,bottom: 8,left: 12,right: 12),
               decoration: BoxDecoration(
                 color: Colors.grey,
                 borderRadius: BorderRadius.circular(10)
               ),
               child: Text("Subscribe",style: TextStyle(color: Colors.white),),
             ),
               ],
             ),
           ),
           SizedBox(
             height: 20,
           ),
                SingleChildScrollView(
       scrollDirection: Axis.horizontal,
            child: Padding(
         padding: const EdgeInsets.only(left:20),
         child: GestureDetector(
           onTap: (){},
    child: Row(
         children:List.generate(songs.length , (index){
           return GestureDetector(
             onTap: (){
               print(songs[index]["title"]);
                   Navigator.push(context, PageTransition(
               type: PageTransitionType.scale,
               alignment: Alignment.bottomCenter,
               child: SongDetail(
               
                 songs[index]["title"],
                
                 songs[index]["description"],
                  songs[index]["color"],
                 songs[index]["img"],
                 songs[index]["song_url"],

               )
             ));
             },
                  child: Padding(
                    padding: const EdgeInsets.only(right:28.0),
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
                    width: size.width-180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                        songs[index ]["song_count"],
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style:
                         TextStyle(color: Colors.grey,
                        fontSize: 12
                        )),
                        Text(
                        songs[index ]["date"],
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style:
                         TextStyle(color: Colors.grey,
                        fontSize: 12
                        )),
                      ],
                    ),
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
          height: 30,
        ),   
        SingleChildScrollView(
          child: Column(
             children:
               List.generate(songeAlbum.length, (index){
                  return Padding(
                    padding: const EdgeInsets.only(left:28.0,right: 28,top: 20),
                    child: GestureDetector(
                      onTap: ()
                      {},
                          child: Row(
                         children: [
                            Container(
                              height: 50,
                              width: (size.width - 60)*0.77,
                              child: Text("${index+1}  "+ songeAlbum[index]["title"],style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              height: 50,
                              width: (size.width - 60)*0.22,
                              child: Row(
                                children: [
                                  Text(songeAlbum[index]["duration"],style: TextStyle(color: Colors.white),),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    width:30 ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.withOpacity(0.8)
                              ),
                              child: Center(
                                 child: Icon(Icons.play_arrow,color: Colors.white,),
                              ),
                            )
                                ],
                              ),
                            ),
                            
                         ],
                      ),
                    ),
                  );
               })
             
          ),
        )   
                
                ],
              ),
          SafeArea(child: Padding(
            padding: const EdgeInsets.only(top:28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              IconButton(icon:Icon(Icons.arrow_back_ios,color: Colors.white,),
              onPressed: (){
              Navigator.of(context).pop();
              },
              ),
              Icon(Icons.more_vert,color: Colors.white,),

            ],),
          )),
         
          ]
        ),
      ),
    );
  }
}