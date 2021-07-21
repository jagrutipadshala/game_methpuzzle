import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:game_methpuzzle/lockpag.dart';
import 'package:game_methpuzzle/winpag.dart';
import 'package:shared_preferences/shared_preferences.dart';

class second extends StatefulWidget {
  int index;
  second(this.index);

  @override
  _secondState createState() => _secondState();
}

class _secondState extends State<second> {

  String num = "";
  List ans = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
              "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40,",
              "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60"];

  SharedPreferences prefs;

  init() async {
    prefs = await SharedPreferences.getInstance();
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  void getbtn_val(String btn_no) {
    num = num + btn_no;
    print("number=$num");
  }

  void backspace() {
    String temp = "";
    temp = num;
    temp = temp.substring(0, temp.length - 1);
    num = temp;
    print(num);
  }


  calldialog(BuildContext context)
  {
    AlertDialog dialog=AlertDialog(
      title: Text("Skip",style: TextStyle(fontSize: 20,color: Colors.black),),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      content: Text("Are you sure you want to skip this level? you can play skipped leves later by6 clicking on PUZZLES menu from main screen",style: TextStyle(fontSize: 15,color: Colors.black),),
      actions: [
        FlatButton(onPressed: (

            ) {
              Navigator.pop(context);

        }, child: Text("CANCEL",style: TextStyle(fontSize: 20,color: Colors.blue),)),
        FlatButton(onPressed: () {
          setState(() {
            skip_fun();
          });
        }, child: Text("OK",style:TextStyle(fontSize: 20,color: Colors.blue),))
      ],
    );
    return dialog;
  }

  skip_fun()
  {
    prefs.setInt("lastlevel", widget.index);
    prefs.setString("level${widget.index}", "skip");
    widget.index++;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return second(widget.index);
    },));

  }
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
          body: Container(
            child: Stack(
              children: [
                Expanded ( flex:4,child:  Container(
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    child: Image(image: AssetImage("assets/gameplaybackground.jpg"),fit: BoxFit.fitHeight,),
                  ),
                  Column(
                    children: [
                      Expanded(flex:1,child:
                      Container(
                          child:
                          Center(child: Row(
                            children: [
                              Expanded(flex:1,
                                child: InkWell(onTap: () {
                                  setState(() {
                                    showDialog(context: context, builder: (context){
                                      return calldialog(context);
                                    },barrierColor: Colors.transparent,
                                      barrierDismissible: true,
                                    );
                                  });
                                },
                                    child:
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("assets/skip.png")
                                          )
                                      ),
                                    )
                                ),

                              ),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                     margin: EdgeInsets.fromLTRB(0, 30, 20, 0),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image(image: AssetImage("assets/level_board.png"),
                                          fit: BoxFit.fill
                                          ,),
                                        Text("Puzzle${widget.index+1} ",style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  )
                              ),
                              Expanded(flex:1,child: Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/hint.png")
                                    )
                                ),
                              )),
                            ],
                          ),)
                      ) ),
                      Expanded(
                        flex: 5,
                        child: Image(image: AssetImage('assets/p${widget.index+1}.png'),fit: BoxFit.fill,),
                      ),
                      Expanded(flex:1,child:
                      Container(
                          height: 100,
                          // width: 100,
                          color: Colors.black,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child:
                                      Container(
                                        height: 40,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // set border width
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.0)), // set rounded corner radius
                                        ),child: Text("${num}",style: TextStyle(fontWeight: FontWeight.bold,fontSize:25),),)
                                  ),
                                  Expanded(flex: 2,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                             backspace();
                                          });
                                        },
                                        child: Container(
                                          // margin: EdgeInsets.fromLTRB(10,0, 20, 0),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.backspace,
                                            size: 60,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                    flex: 3,
                                    child: FlatButton(
                                      child: Text("submit",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25)),
                                      onPressed: () {
                                        if(ans[widget.index]==num)
                                          {
                                            prefs.setInt("lastlevel", widget.index);
                                            prefs.setString("level${widget.index}","win");
                                            widget.index++;
                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return fourth(widget.index);
                                            },));
                                          }
                                        else
                                          {
                                            print("not match");
                                            Fluttertoast.showToast(msg: "wrong");
                                          }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child:
                                      InkWell(onTap: () {
                                        setState(() {
                                          getbtn_val('1');
                                        });
                                      },
                                        child: Container(
                                          // margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.white70,width: 2)
                                          ),
                                          child: Center(child: Text("1", style: TextStyle(color: Colors.white, fontSize: 20),)),
                                        ),
                                      )),
                                  Expanded(
                                      child:
                                      InkWell(onTap: () {
                                        setState(() {
                                           getbtn_val('2');
                                        });
                                      },
                                        child: Container(margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.white70,width: 2)
                                          ),
                                          child: Center(child: Text("2", style: TextStyle(color: Colors.white, fontSize: 20),)),
                                        ),
                                      )),
                                  Expanded(
                                      child:
                                      InkWell(onTap: () {
                                        setState(() {
                                          getbtn_val('3');
                                        });
                                      },
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.white70,width: 2)
                                          ),
                                          child: Center(child: Text("3", style: TextStyle(color: Colors.white, fontSize: 20),)),
                                        ),
                                      )),
                                  Expanded(
                                      child:
                                      InkWell(onTap: () {
                                        setState(() {
                                          getbtn_val('4');
                                        });
                                      },
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.white70,width: 2)
                                          ),
                                          child: Center(child: Text("4", style: TextStyle(color: Colors.white, fontSize: 20),)),
                                        ),
                                      )),
                                  Expanded(
                                      child:
                                      InkWell(onTap: () {
                                        setState(() {
                                          getbtn_val('5');
                                        });
                                      },
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.white70,width: 2)
                                          ),
                                          child: Center(child: Text("5", style: TextStyle(color: Colors.white, fontSize: 20),)),
                                        ),
                                      )),
                                  Expanded(
                                      child:
                                      InkWell(onTap: () {
                                        setState(() {
                                          getbtn_val('6');
                                        });
                                      },
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.white70,width: 2)
                                          ),
                                          child: Center(child: Text("6", style: TextStyle(color: Colors.white, fontSize: 20),)),
                                        ),
                                      )),
                                  Expanded(
                                      child:
                                      InkWell(onTap: () {
                                        setState(() {
                                          getbtn_val('7');
                                        });
                                      },
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.white70,width: 2)
                                          ),
                                          child: Center(child: Text("7", style: TextStyle(color: Colors.white, fontSize: 20),)),
                                        ),
                                      )),
                                  Expanded(
                                      child:
                                      InkWell(onTap: () {
                                        setState(() {
                                          getbtn_val('8');
                                        });
                                      },
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.white70,width: 2)
                                          ),
                                          child: Center(child: Text("8", style: TextStyle(color: Colors.white, fontSize: 20),)),
                                        ),
                                      )),
                                  Expanded(
                                      child:
                                      InkWell(onTap: () {
                                        setState(() {
                                          getbtn_val('9');
                                        });
                                      },
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.white70,width: 2)
                                          ),
                                          child: Center(child: Text("9", style: TextStyle(color: Colors.white, fontSize: 20),)),
                                        ),
                                      )),
                                  Expanded(
                                      child:
                                      InkWell(onTap: () {
                                        setState(() {
                                          getbtn_val('0');
                                        });
                                      },
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.white70,width: 2)
                                          ),
                                          child: Center(child: Text("0", style: TextStyle(color: Colors.white, fontSize: 20),)),
                                        ),
                                      )),
                                ],
                              ),

                            ],

                          )

                      ) )
                    ],
                  )
                ],
              ),
            )
                )
              ],
            ),
          ),
        ));
  }
}
