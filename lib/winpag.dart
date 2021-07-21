import 'package:flutter/material.dart';
import 'package:game_methpuzzle/main.dart';
import 'package:game_methpuzzle/puzzlepaggame.dart';

class fourth extends StatefulWidget {
  int index;
  fourth(this.index);

  @override
  _fourthState createState() => _fourthState();
}

class _fourthState extends State<fourth> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:  Scaffold(
          body:
          Container(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  child: Image(image: AssetImage("assets/background.jpg"),fit: BoxFit.fitHeight,),
                ),
                Column(
                  children: [
                    Expanded(
                        flex:1,
                        child:Container(
                          alignment: Alignment.center,
                          child: Text(" Puzzle ${widget.index} Completed",style: TextStyle(color: Colors.blue,fontSize: 30,fontFamily: 'chalk', fontWeight: FontWeight.bold),),
                        ) ),
                    Expanded(
                      flex: 4,
                      child: Image(image: AssetImage("assets/trophy.png"),fit: BoxFit.fill,),
                    ),

                    Expanded(flex: 1,
                      child:InkWell(
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return second(widget.index);
                          },));
                        },
                        child:
                        Container(
                          width: 180,
                          decoration: new BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black,Colors.white70,Colors.black]),
                            color: Colors.grey,
                            border: new Border.all(color: Colors.white, width: 8.0),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: new Center(child: new Text("Continue".toUpperCase(),style: TextStyle(color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'chalk',fontWeight: FontWeight.bold)),),
                        ),
                      ),
                    ),

                    Expanded(flex: 1,
                      child:InkWell(
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return test();
                          },));
                        },
                        child:
                        Container(
                          width: 180,
                          decoration: new BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black,Colors.white70,Colors.black]),
                            color: Colors.grey,
                            border: new Border.all(color: Colors.white, width: 8.0),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: new Center(child: new Text("Main Menu".toUpperCase(),style: TextStyle(color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'chalk',fontWeight: FontWeight.bold)),),
                        ),
                      ),
                    ),
                    Expanded(flex: 1,
                      child:InkWell(
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return test();
                          },));
                        },
                        child: Container(
                          width: 180,
                          decoration: new BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black,Colors.white70,Colors.black]),
                            border: new Border.all(color: Colors.white, width: 8.0),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: new Center(child: new Text("Buy Pro", style: new TextStyle(fontSize: 20.0, color: Colors.black87,fontWeight: FontWeight.bold),),),
                        ),
                      ),
                    ),
                    Expanded(
                        flex:1,
                        child:Container(
                          alignment: Alignment.center,
                          child: Text(" SHARE THIS PUZZLE",style: TextStyle(color: Colors.blue,fontSize: 30, fontWeight: FontWeight.bold),),
                        ) ),
                    Expanded(
                        flex: 1,
                        child:  Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black26,Colors.white70]),
                              borderRadius: BorderRadius.circular(150),
                              color: Colors.white),
                          child: Icon(Icons.share, size: 30,),
                        )
                    ),
                  ],
                )
              ],
            ),
          ) ,
        )
       );
  }
}
