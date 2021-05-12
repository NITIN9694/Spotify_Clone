import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SongDetail extends StatefulWidget {
 final String title;
 final Color color;
 final String descripation;
 final String img;
 final String songurl;
 SongDetail(this.title,this.descripation,this.color,this.img,this.songurl);

  @override
  _SongDetailState createState() => _SongDetailState();
}

class _SongDetailState extends State<SongDetail> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppbar(),
      body: getBody(),
    );
  }
  Widget getAppbar(){
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      automaticallyImplyLeading: false,
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              IconButton(icon:Icon(Icons.arrow_back_ios,color: Colors.white,),
              onPressed: (){
              Navigator.of(context).pop();
              },
              ),
              Icon(Icons.more_vert,color: Colors.white,),

            ],),);
  }
  Widget getBody(){
    var size = MediaQuery.of(context).size;
    double _cureentvalue =20;

     AudioPlayer advancedPlayer;
  AudioCache audioCache;
  bool isPlaying = false;
 
  playSound(localPath) async {
    await audioCache.play(localPath);
  }

  stopSound(localPath) async {
    File audioFile = await audioCache.load(localPath);
    await advancedPlayer.setUrl(audioFile.path);
    advancedPlayer.stop();
  }

  seekSound() async {
    File audioFile = await audioCache.load(widget.songurl);
    await advancedPlayer.setUrl(audioFile.path);
    advancedPlayer.seek(Duration(milliseconds: 2000));
  }


  initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    playSound(widget.songurl);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stopSound(widget.songurl);
  }
    return SingleChildScrollView(
          child: Column(
        children: [
          Stack(
                children:[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:38.0,top: 50),
                  child: Container(
                      height:size.height*0.4,
                      width: size.width-60,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: widget.color,offset: Offset(-10,40),blurRadius: 40,spreadRadius: 5)
                        ],
                       borderRadius: BorderRadius.circular(20),
                       image: DecorationImage(image: AssetImage(widget.img),fit: BoxFit.cover)
                        
                      ),
                    ),
                ),
                SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top:28.0),
              child: Container(
                width: size.width-80,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.folder,color: Colors.white),
                     Padding(
                       padding: const EdgeInsets.only(bottom:18.0),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Text(widget.title,style: TextStyle(color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                    ),),
                    Container(
                        width: 150,
                        child: Text(widget.descripation,
                        maxLines: 1,
                        style: TextStyle(color: Colors.white,
                        fontSize: 14
                        ),),
                    ),
                    
                  ],
                ),
                     ),
                 Icon(Icons.more_vert,color: Colors.white,),
                  ],
                )),
            ),
             SizedBox(height: 20,),
             Slider(value: _cureentvalue,
             activeColor: Colors.green,
              min: 0,
              max: 200,
                onChanged:(value){
                  setState(() {
                    _cureentvalue = value;
                  });
                  seekSound();
                }),
                 SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left:28.0,right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("1.28",style: TextStyle(color: Colors.grey),),
                    Text("4.15",style: TextStyle(color: Colors.grey),)
                  ],),
                    SizedBox(
              height: 40,
            ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                   Icon(Icons.shuffle,color:Colors.white),
                    Icon(Icons.skip_previous,color:Colors.white),
                   GestureDetector(
                     onTap: (){
                     
                       setState(() {
                         isPlaying =true;
                          
                       });
                    
                       
                    
                     },
                    child: Container(
                       height: 50,
                       width: 50,
                       decoration: BoxDecoration(
                         color: Colors.green,
                         borderRadius: BorderRadius.circular(40)
                       ),
                       child: Center(child: 
                       isPlaying?
                       Icon(Icons.pause,color:Colors.white): Icon(Icons.play_arrow,color:Colors.white),),
                     ),
                   ),                      
                    Icon(Icons.skip_next,color:Colors.white),
                      Icon(Icons.repeat,color:Colors.white),
                  ],),
                ],
              ),
            ),
              ],
            ),
           
          ]
          ),
        ],
      ),
    );
  }
}
