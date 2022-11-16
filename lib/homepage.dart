import 'package:flutter/material.dart';

import 'grocery_page.dart';

List image = ["assets/grocery.png","assets/elec.png"];
List title = ["Grocery","Electronic"];

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _homepage();
  }
}

class _homepage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.green,
       appBar: AppBar(
         backgroundColor: Colors.green,
         title: Text("Categories",style: TextStyle(color: Colors.white),),
         centerTitle: true,
         elevation: 0,
       ),
       floatingActionButton: Padding(
         padding: EdgeInsets.only(top: 20),
         child: SizedBox(
           height: 70,
           width: 70,
           child: FloatingActionButton(
             backgroundColor: Colors.transparent,
             elevation: 0,
             onPressed: () {},
             child: Container(
               height: 70,
               width: 70,
               decoration: BoxDecoration(
                 color: Colors.white,
                 shape: BoxShape.circle,
               ),
               child: Container(
                 margin: const EdgeInsets.all(5),
                 height: 50,
                 width: 50,
                 decoration: BoxDecoration(
                   border: Border.all(color: Colors.green, width: 4),
                   shape: BoxShape.circle,
                   color: Colors.white
                   // gradient: LinearGradient(
                   //   begin: const Alignment(0.7, -0.5),
                   //   end: const Alignment(0.6, 0.5),
                   //   colors: [
                   //     Color(0xFF53a78c),
                   //     Color(0xFF70d88b),
                   //   ],
                   // ),
                 ),
                 child: Icon(Icons.shopping_cart_rounded, size: 30,color: Colors.green,),
               ),
             ),
           ),
         ),
       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       bottomNavigationBar: BottomAppBar(
         color: Colors.green,
         child: Container(
           height: 70,
           color: Colors.green,
           child:  Row(
             mainAxisSize: MainAxisSize.max,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   IconButton(
                     iconSize: 25.0,
                     padding: EdgeInsets.only(left: 28.0),
                     icon: Icon(Icons.home,color: Colors.white,),
                     onPressed: () {
                       setState(() {

                       });
                     },
                   ),
                   Padding(
                     padding:EdgeInsets.only(left: 28.0),
                     child: Text("Home",style: TextStyle(color: Colors.white),),
                   )
                 ],
               ),
               Column(
                 //mainAxisAlignment: MainAxisAlignment.center,
                 //crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   IconButton(
                     iconSize: 25.0,
                     padding: EdgeInsets.only(right: 28.0),
                     icon: Icon(Icons.dashboard,color: Colors.white,),
                     onPressed: () {
                       setState(() {

                       });
                     },
                   ),
                   Padding(
                     padding:EdgeInsets.only(right: 28.0),
                     child: Text("Category",style: TextStyle(color: Colors.white),),
                   )
                 ],
               ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   IconButton(
                     iconSize: 25.0,
                     padding: EdgeInsets.only(left: 28.0),
                     icon: Icon(Icons.laptop,color: Colors.white,),
                     onPressed: () {
                       setState(() {

                       });
                     },
                   ),
                   Padding(
                     padding:EdgeInsets.only(left: 28.0),
                     child: Text("Order",style: TextStyle(color: Colors.white),),
                   )
                 ],
               ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   IconButton(
                     iconSize: 25.0,
                     padding: EdgeInsets.only(right: 28.0),
                     icon: Icon(Icons.person,color: Colors.white,),
                     onPressed: () {
                       setState(() {

                       });
                     },
                   ),
                   Padding(
                     padding:EdgeInsets.only(right: 28.0),
                     child: Text("Profile",style: TextStyle(color: Colors.white),),
                   )
                 ],
               ),
             ],
           ),
         ),
       ),
       body: SafeArea(
         child: Container(
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(25),
             border: Border.all(color: Colors.green.withOpacity(0.6),width: 8)
           ),
           child: ListView.builder(
               itemCount: 2,
               scrollDirection: Axis.horizontal,
               itemBuilder: (BuildContext context, int index) {
                 return Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: InkWell(
                     onTap: (){
                       if(index == 0){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>grocery()));
                       }
                       else{
                         null;
                       }
                     },
                     child: Column(
                       children: [
                         ClipRRect(
                             borderRadius:BorderRadius.circular(15),
                             child: Image.asset(image[index],width: 70,height: 70,fit: BoxFit.cover,)),
                         Text(title[index],style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600),)

                       ],
                     ),
                   ),
                 );
               }),
         ),
       ),
     );
  }
}