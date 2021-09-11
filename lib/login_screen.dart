import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';
import 'reusable_card.dart';

var game_name;
var urlxyz;
var tournament_name;
var game_name2;
var urlxyz2;
var tournament_name2;
var game_name3;
var urlxyz3;
var tournament_name3;

var tp;
var twon;
var timage;
var trating;
var name;

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Future<dynamic> getData() async {
    http.Response response = await http.get(
        "http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all");

    var data = response.body;
    var dd = jsonDecode(data);
    print(dd);

    http.Response response2 = await http.get(
        "https://69777860-5db0-4df2-a170-978705c9ada2.mock.pstmn.io/get"); //mocked api
    var data2 = response2.body;
    var dd2 = jsonDecode(data2);

    setState(() {
      urlxyz = dd['data']['tournaments'][0]['cover_url'];
      game_name = dd['data']['tournaments'][0]['game_name'];
      tournament_name = dd['data']['tournaments'][0]['name'];

      urlxyz2 = dd['data']['tournaments'][1]['cover_url'];
      game_name2 = dd['data']['tournaments'][1]['game_name'];
      tournament_name2 = dd['data']['tournaments'][1]['name'];
      urlxyz3 = dd['data']['tournaments'][4]['cover_url'];
      game_name3 = dd['data']['tournaments'][4]['game_name'];
      tournament_name3 = dd['data']['tournaments'][4]['name'];

      tp = dd2['user']['tourney'];
      twon = dd2['user']['tourneywon'];
      timage = dd2['user']['photo'];
      trating = dd2['user']['elorating'];
      name = dd2['user']['name'];
      return dd;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'GreyWinds',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 20,
                width: 10,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  CircleAvatar(
                      radius: 50.0, backgroundImage: NetworkImage('$timage')),
                  SizedBox(
                    height: 10,
                    width: 15,
                  ),
                  Column(children: <Widget>[
                    Text(
                      '$name',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text('$trating Elo Rating',
                          style: TextStyle(
                            color: Colors.blue[400],
                          )),
                    ),
                  ])
                ],
              ),

              SizedBox(
                height: 20,
                width: 20,
              ),

              //row2
              Row(children: <Widget>[
                SizedBox(
                  height: 10,
                  width: 6,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: 130,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          colors: <Color>[
                            Color.fromRGBO(228, 123, 3, 1),
                            Color.fromRGBO(235, 161, 4, 1)
                          ]),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.white),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$tp',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Tournaments Played',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: 130,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          end: Alignment.topRight,
                          begin: Alignment.centerLeft,
                          colors: <Color>[
                            Color.fromRGBO(64, 32, 149, 1),
                            Color.fromRGBO(181, 113, 201, 1)
                          ]),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.white),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$twon', //from api
                          style: TextStyle(
                            fontSize: 17.0,
                            //fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Tournaments Won',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.0,
                            //fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: 130,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          colors: <Color>[
                            Color.fromRGBO(236, 87, 69, 1),
                            Color.fromRGBO(242, 171, 140, 1)
                          ]),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.white),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '18 %',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Winning Percentage',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.0,
                            //fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),

              SizedBox(
                height: 20,
                width: 20.0,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  '   Recommended for you',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 22,
                width: 30.0,
              ),
              //CARDS BEGINNING HERE
              //TODO:: CARD INSIDE BUILDER.LISTVIEW
              // ListView.builder(
              // itemCount: 1,
              // shrinkWrap: true,
              // itemBuilder: (BuildContext context,int index){

              // return
              // ReusableCard(
              //   cardChild: Column(
              //     crossAxisAlignment: CrossAxisAlignment.stretch,
              //     children: <Widget>[
              //       ClipRRect(
              //           borderRadius: BorderRadius.only(
              //               topLeft: Radius.circular(25.0),
              //               topRight: Radius.circular(25.0)),
              //           child: Image(image: NetworkImage('$urlxyz'))),

              //       SizedBox(height: 5, width: double.infinity),
              //       Flexible(
              //         child: Text('  $tournament_name',
              //             maxLines: 1,
              //             softWrap: false,
              //             overflow: TextOverflow.fade,
              //             textAlign: TextAlign.left,
              //             style: TextStyle(
              //                 fontSize: 17,
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.bold)),
              //       ),
              //       SizedBox(height: 5, width: double.infinity),
              //       Text(
              //         '   $game_name',
              //         textAlign: TextAlign.left,
              //         style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w400,
              //             color: Colors.black),
              //       ),

              //       //1ST IS IMAGE
              //       //2ND IS DETS
              //     ],
              //   ),
              // );})

              ReusableCard(
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0)),
                        child: Image(image: NetworkImage('$urlxyz'))),
                    SizedBox(height: 5, width: double.infinity),
                    Flexible(
                      child: Text('  $tournament_name',
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 5, width: double.infinity),
                    Text(
                      '   $game_name',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
                width: double.infinity,
              ),
              ReusableCard(
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0)),
                        child: Image(image: NetworkImage('$urlxyz2'))),
                    SizedBox(height: 5, width: double.infinity),
                    Flexible(
                      child: Text('  $tournament_name2',
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 5, width: double.infinity),
                    Text(
                      '   $game_name2',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 15,
                width: double.infinity,
              ),
              ReusableCard(
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0)),
                        child: Image(image: NetworkImage('$urlxyz3'))),
                    SizedBox(height: 5, width: double.infinity),
                    Flexible(
                      child: Text('  $tournament_name3',
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 5, width: double.infinity),
                    Text(
                      '   $game_name3',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5, width: double.infinity),
            ],
          )
        ],
      ),
    );
  }
}
