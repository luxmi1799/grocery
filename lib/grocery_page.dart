import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class grocery extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _grocery();
  }
}

class _grocery extends State<grocery> {
   var categorylist ;
   var productcategory;
   int unit = 0;
   int _isSelected = 0;
   int product = 0;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), onPressed: () { Navigator.pop(context); },
        ),
        backgroundColor: Colors.green,
        title: Text("Grocery",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.green.withOpacity(0.6),width: 8)
          ),
          child: categorylist!=null?Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 70,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categorylist.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 10),
                        child: GestureDetector(
                          onTap: (){
                            setState((){
                              _isSelected = index;
                               getproductcategory(int.parse(categorylist[index]["categoryid"]));
                            });
                          },
                          child:Container(
                            width: 120,
                             height: 20,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               border:Border.all(color: _isSelected == index ?Colors.green:Colors.grey,width: 2),
                             ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(categorylist[index]["imgurl"],width: 30,height: 30,fit: BoxFit.fill,),
                                ),
                                Text(categorylist[index]["name"],style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.7,
                child: productcategory!=null?GridView.builder(
                  itemCount: productcategory.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:  2 ),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                        children: [
                          Image.network(productcategory[index]["imgurl"],width: 50,height: 50,),
                          SizedBox(height: 10,),
                          Text(productcategory[index]["name"],style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                          Container(
                            height: 47,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: productcategory[index]["details"].length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int i) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 10),
                                    child: GestureDetector(
                                      onTap: (){
                                        setState((){
                                          unit = i;
                                          product = index;
                                          print("prodd $product $unit");
                                        });
                                      },
                                      child:Container(
                                       // width: 120,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: product == index && unit == i?Colors.green:Colors.white

                                        ),
                                        child: Center(
                                          child: Text(productcategory[index]["details"][i]["size"]+productcategory[index]["details"][i]["unit"],
                                            style: TextStyle(  color: product == index && unit == i?Colors.white:Colors.green),),
                                        )
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Align(alignment: Alignment.bottomRight,
                            child: Container(
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20))
                            ),
                           child: Center(child: Text("Rs."+
                                 productcategory[index]["details"][unit]["selling_price"]??"",
                                 style: TextStyle(color: Colors.white),)),
                          ),)
                        ],
                      )
                    );
                  },
                ):Text("No data Found"),
              ),
            ],
          ):Center(child: CircularProgressIndicator(),),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getcategory();
  }

  Future<String> getcategory() async {
    var url = Uri.parse('http://mochak.frantic.in/app/Api/subcategory/5');
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        setState(() {
          categorylist = jsonDecode(data)["data"];
        });
        print("categorylist $categorylist");
        return categorylist;
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }

  Future<String> getproductcategory(int id) async {
    var url = Uri.parse('http://mochak.frantic.in/app/Api/productbycategoryid/$id');
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        setState(() {
          productcategory = jsonDecode(data)["data"];
        });
        print("productcategory $productcategory");
        return productcategory;
      } else {
        return 'failed';
      }
    } catch (e) {
      return 'failed';
    }
  }

}