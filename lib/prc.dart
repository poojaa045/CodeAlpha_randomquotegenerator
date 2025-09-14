
import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
    home:Scaffold(
        appBar: AppBar(
          title:Text("MyAppBar"),
          backgroundColor: Colors.grey,

        ),
        body:Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(5),
                        color: Colors.white
                    ) ,
                    child:const Padding(
                      padding:EdgeInsets.all(8.0),
                      child: Icon(Icons.send, size: 70,color: Colors.brown,),
                    ),
                  ),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(5),
                        color: Colors.black12
                    ) ,
                    child:const Padding(
                      padding:EdgeInsets.all(8.0),
                      child: Text('send',style:TextStyle(fontSize:30,color:Colors.white)),
                    ),
                  ),
                ],

              ),
            ),SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(5),
                        color: Colors.white
                    ) ,
                    child:const Padding(
                      padding:EdgeInsets.all(8.0),
                      child: Icon(Icons.cabin, size: 70,color: Colors.brown,),
                    ),
                  ),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(5),
                        color: Colors.black12
                    ) ,
                    child:const Padding(
                      padding:EdgeInsets.all(8.0),
                      child: Text('cabin',style:TextStyle(fontSize:30,color:Colors.white)),
                    ),
                  ),
                ],

              ),
            ),SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(5),
                        color: Colors.white
                    ) ,
                    child:const Padding(
                      padding:EdgeInsets.all(8.0),
                      child: Icon(Icons.accessibility, size: 70,color: Colors.brown,),
                    ),
                  ),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(5),
                        color: Colors.black12
                    ) ,
                    child:const Padding(
                      padding:EdgeInsets.all(8.0),
                      child: Text('person',style:TextStyle(fontSize:30,color:Colors.white)),
                    ),
                  ),
                ],

              ),
            ),SizedBox(height: 50,),
          ],
        )
    )


));
