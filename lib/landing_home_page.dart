import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'navbar.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data=[];
  List imagesUrl = [];

  get http => null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  Future<String> fetchDataFromApi() async {
    var jsonData = await http.get(
        "https://fakestoreapi.com/products");
    var fetchData = jsonDecode(jsonData.body);
    setState(() {
      data = fetchData;
      data.forEach((element) {
        imagesUrl.add(element['url']);
      });
    });
    return "Success";
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack),
           label: 'Audio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),

      body: Container(
          height:double.infinity,
          width: double.infinity,
          color: Colors.black12,
          child:ListView(
            children: [
            const Padding(
               padding:  EdgeInsets.fromLTRB(56.0,8.0,46.0,8.0),
               child:   Text('Landing Home Page',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 28)),
             ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0,14,14,14),
                child: Container(

                  height: 900,
                  width: double.infinity,
                 // color: Colors.blue,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(3, 3), // changes position of shadow
                        )

                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left:15.0,top: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/wave.png',height: 55,width: 30,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text('Good morning',style: TextStyle(color: Colors.black12,fontWeight: FontWeight.bold,fontSize: 16),),
                                   Text('nicholas',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),

                                ],
                              ),
                            ),
                            const SizedBox(width: 135,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height:3,
                                  width: 30,
                                  color: Colors.black54,
                                ),
                                const SizedBox(height: 4,),
                                Container(
                                  height:3,
                                  width: 20,
                                  color: Colors.black54,
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          height: 50,
                          width:300,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: Colors.white,

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(3, 3), // changes position of shadow
                                )

                              ]),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width:55,
                                //color: Colors.white,
                                child:const  Center(
                                  child: Icon(Icons.search),
                                ),
                              ),

                              Container(
                                child: Text('search product you wish'),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                       Row(
                         children: [
                          const Text('Daily Deals',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 20),),
                          const SizedBox(width: 150,),
                          Container(
                             height: 5,
                             width: 10,

                             decoration:const BoxDecoration(
                               shape: BoxShape.circle,
                               color: Colors.black54
                             ),
                           ),
                           SizedBox(width: 15,),
                           Container(
                             height: 5,
                             width: 10,

                             decoration:const BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.grey
                             ),
                           ),
                           SizedBox(width: 15,),
                           Container(
                             height: 5,
                             width: 10,

                             decoration:const BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.grey
                             ),
                           )

                         ],
                       ),
                        SizedBox(height:10),
                        Container(
                          height: 200,
                          width: 500,
                          color: Colors.white,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                height: 200,
                                width: 180,
                                //color: Colors.blue,
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white70,
                            ),
                                  child: Image.asset('assets/images/phone3.jpg',height: 200,width: 180,),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                height: 200,
                                width: 180,
                               // color: Colors.blue,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white70,
                                  ),
                                child: Image.asset('assets/images/phone2.jpg',height: 200,width: 180,

                                ),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                height: 200,
                                width: 180,
                               // color: Colors.blue,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white70,
                                  ),
                                child: Image.asset('assets/images/phone3.jpg',height: 200,width: 180,),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            const Text('Popular Catagories',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 20),),
                            const SizedBox(width: 80,),
                            Container(
                              height: 5,
                              width: 10,

                              decoration:const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black54
                              ),

                            ),
                            SizedBox(width: 15,),
                            Container(
                              height: 5,
                              width: 10,

                              decoration:const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey
                              ),

                            ),
                            SizedBox(width: 15,),
                            Container(
                              height: 5,
                              width: 10,

                              decoration:const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey
                              ),

                            )

                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 100,
                          width: double.infinity,
                          color: Colors.white,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                  height: 10,
                                  width: 180,
                                  //color: Colors.blue,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white70,
                                  ),
                                child: Image.asset('assets/images/shoe1.jpg',height: 10,width: 180,),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                  height: 10,
                                  width: 180,
                                  // color: Colors.blue,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white,
                                  ),
                                child:   Image.asset('assets/images/shoe2.jpg',height: 10,width: 180),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                  height: 10,
                                  width: 180,
                                  // color: Colors.blue,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white,
                                  ),
                                 child:   Image.asset('assets/images/shoe3.jpg',height: 10,width: 180,),
                              ),

                            ],
                          ),
                        ),

                      ],



                    ),
                  ),
                ),
              ),

            ],
          )
      ),
    );
  }
}



