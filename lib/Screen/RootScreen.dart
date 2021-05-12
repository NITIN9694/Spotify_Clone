import 'package:flutter/material.dart';
import 'package:spotify/Screen/HomePage.dart';



class RootScrren extends StatefulWidget {
  @override
  _RootScrrenState createState() => _RootScrrenState();
}

class _RootScrrenState extends State<RootScrren> {
   int activetab =0;
  Widget body(){
return IndexedStack(
 index:activetab,
 children: [
   HomePage(),
   Center(
     child: Text("Library",style: TextStyle(color: Colors.white,fontSize: 20),),
   ),
   Center(
     child: Text("Search",style: TextStyle(color: Colors.white,fontSize: 20),),
   ),
   Center(
     child: Text("Setting",style: TextStyle(color: Colors.white,fontSize: 20),),
   ),
 ],
);
}
Widget bottombar(){
   List item=[
   Icons.home,
   Icons.book,
   Icons.search,
   Icons.settings
  ];
return Container(

    height: 80,
   decoration: BoxDecoration(
     color: Colors.black
   ),
  child: Padding(
    padding: const EdgeInsets.only(left:28.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: 
        List.generate(item.length, (index) {
          return IconButton(
          icon:Icon( item[index],
          color: activetab==index?Colors.green:Colors.white,
          ),
          onPressed: (){
          setState(() {
           activetab=index;
          });
          },
          );
        })
      
    ),
  ),
  
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
       bottomNavigationBar: bottombar(),
     body: body(),
    );
    
  }
}
