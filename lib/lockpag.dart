import 'package:flutter/material.dart';
import 'package:game_methpuzzle/puzzlepaggame.dart';

class third extends StatefulWidget {
  List<String> status;
  int lastlevel;
  third(this.status,this.lastlevel);

  @override
  _thirdState createState() => _thirdState();
}
class _thirdState extends State<third> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:Container(
        child:Stack(
          children: [
            Container(
              height: double.infinity,
              child: Image(image: AssetImage("assets/background.jpg"),
                fit: BoxFit.fitHeight,),
            ),
            Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text("Select Puzzles", style: TextStyle(fontSize: 40,color: Colors.blue,
                          fontWeight: FontWeight.bold,fontFamily: 'chalk'),),
                    )
                ),
                Expanded(
                    flex:5,
                    child:
                    Container(
                      child: GridView.builder(itemCount: 50,
                        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 9,
                          crossAxisSpacing:5,
                          crossAxisCount: 4,
                        ) , itemBuilder: (context,index) {
                          if(widget.status[index]=="pending")
                          {
                            return InkWell(
                                onTap:index>widget.lastlevel+1?null: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return second(index);
                                  },));
                                },
                                child:index==widget.lastlevel+1?Center(child: Text("${index+1}",style: TextStyle(fontSize: 40,fontFamily: "chalk")),)
                                    : Image(image: AssetImage("assets/lock.png"),)
                            );
                          }
                          if(widget.status[index]=="skip")
                          {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return second(index);
                                },));
                              },child: Container(decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black,width: 2),
                            ),child: Container(child: Center(child: Text("${index+1}",style: TextStyle(fontSize: 40,fontFamily: "chalk"),),),),
                            ),
                            );
                          }
                          if(widget.status[index]=="win")
                          {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return second(index);
                                },));
                              },
                              child: Container(decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black,width: 2),

                                  image: DecorationImage(
                                      image: AssetImage("assets/tick.png")
                                  )
                              ),child: Center(child: Text("${index+1}",style: TextStyle(fontSize: 40,fontFamily: "chalk")),),
                              ),
                            );
                          }
                          // return Container(
                          //   width: 100,
                          //   height: 100,
                          //   child: InkWell(onTap: () {
                          //     setState(() {
                          //       Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //         return second();
                          //       },));
                          //
                          //     });
                          //
                          //   },child: Center(
                          //     child: Stack(
                          //       alignment: Alignment.center,
                          //       children: [
                          //         Visibility(child: Image(image: AssetImage("assets/lock.png"),fit: BoxFit.fill,))
                          //       ],
                          //     ),),),
                          //
                          // );
                        },),
                    ) )
              ],
            ),

          ],
        )

      )

    ));
  }
}


























