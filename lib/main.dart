import 'package:flutter/material.dart';
import 'package:game_methpuzzle/lockpag.dart';
import 'package:game_methpuzzle/puzzlepaggame.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner:false,home: test(),));
}
class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  SharedPreferences prefs;
  int lastlevel;
  String key;
  List<String>status=List();

  init() async {
    prefs = await SharedPreferences.getInstance();
    lastlevel=prefs.getInt("lastlevel")??0;
    print(lastlevel);

    for(int i=0;i<50;i++)
    {
      key=prefs.getString("level$i")??"pending";
      status.add(key);
      print("level$i=$key");
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }


  @override
  Widget build(BuildContext context) {
    return
      SafeArea(child:  Scaffold(
      body: Container(
        child: Stack(
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
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(" Math Puzzles", style: TextStyle(
                          color: Colors.blue,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                      ),),
                    )
                ),
                Expanded(flex:4,
                    child:Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/p.png"), fit: BoxFit.fill,),
                        ),
                        child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text("")
                                ),
                                Expanded(
                                  flex: 1,
                                  child:
                                  FlatButton(
                                    child: Text("Continue".toUpperCase(),
                                      style: TextStyle(color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'chalk'),),
                                    onPressed: () {
                                      if(lastlevel==0)
                                        {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) {
                                                return second(lastlevel);
                                              },)
                                          );
                                        }
                                      else
                                        {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) {
                                                return second(lastlevel+1);
                                              },)
                                          );
                                        }
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: FlatButton(
                                    child: Text("Puzzles".toUpperCase(),
                                      style: TextStyle(color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'chalk'),),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return third(status,lastlevel);
                                          },)
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: FlatButton(
                                    child: Text("Buy pro".toUpperCase(),
                                      style: TextStyle(color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'chalk'),),
                                    onPressed: () {
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context) {
                                      //       return third();
                                      //     },)
                                      // );
                                    },
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Text("")
                                ),
                              ],
                            )
                        )
                    ) ),
                Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(""),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(""),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Expanded(flex: 1,
                                    child: Row(
                                      children: [
                                        Expanded(
                                             flex: 1,
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              margin: EdgeInsets.fromLTRB(0, 0, 15, 10),
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [Colors.black26,Colors.white70]),
                                                  borderRadius: BorderRadius.circular(15),
                                                  color: Colors.white),
                                              child: Icon(Icons.share, size: 40,),
                                            )
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              margin: EdgeInsets.fromLTRB(0, 0, 15, 10),
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [Colors.black26,Colors.white70]),
                                                  borderRadius: BorderRadius.circular(15),
                                                  color: Colors.white),
                                              child: Icon(Icons.email, size: 40,),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text("Privacy policy"),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                    )
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
