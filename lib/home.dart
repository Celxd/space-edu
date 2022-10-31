import 'dart:async';
import 'dart:convert';

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_edu/apodModel.dart';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  apodModel? _apodModel;
  bool isloaded = false;
  bool checkExist = false;
  bool checkExist1 = false;
  bool checkExist2 = false;

  FutureOr<apodModel?> getApod() async {
    setState(() {
      isloaded = false;
    });
    final res = await http.get(
      Uri.parse(
          "https://api.nasa.gov/planetary/apod?api_key=IcbWbmCcUpgThyyXOEbUcnojCbyYAWqMVrFJhanO"),
    );
    print("status code " + res.statusCode.toString());
    _apodModel =
        apodModel.fromJson(json.decode(res.body.toString()));
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApod();
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Color.fromRGBO(15, 15, 46, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: 
        Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(24, 24, 24, 15),
              child: Row(
                children: [
                  Image(image: AssetImage("assets/icons/lists.png"), width: 24, height: 17.44,),
                  Expanded(child: Image(image: AssetImage("assets/logo/space_edu_logo.png"), width: 135, height: 24,)),
                  Icon(Icons.notifications_none_outlined, color: Colors.white, size: 24,),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(18, 0, 29, 0),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
              child: Row(
                children: [
                  Expanded(            
                    child: Text("Let's Explore\nNew Galaxies", style: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.outfit(fontWeight: FontWeight.w600).fontFamily,
                      fontSize: 24,
                      letterSpacing: 2,
                    ),),
                  ),
                  Image(image: AssetImage("assets/icons/astronaut-helmet.png"), width: 80, height: 80,),
                ],
              ),
            ),
            Stack(
              children: [
                isloaded ?
                Container(
                  width: double.infinity,
                  height: 213,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(_apodModel!.url.toString()),
                      fit: BoxFit.fitWidth,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.srcOver),
                    ),
                  ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(23, 23, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(_apodModel!.title.toString(), textAlign: TextAlign.start, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Mohave',
                            fontSize: 16, 
                            letterSpacing: 2,
                            fontWeight: FontWeight.normal,
                          ),),
                        ],
                      ),
                      SizedBox(
                        height: 140,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(0, 0, 24, 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text('By: '+_apodModel!.copyright.toString(), textAlign: TextAlign.start, style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Mohave',
                                  fontSize: 12, 
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.normal,
                                ),),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(_apodModel!.date.toString(), textAlign: TextAlign.end, style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Mohave',
                                fontSize: 12, 
                                letterSpacing: 2,
                                fontWeight: FontWeight.normal,
                              ),),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ) : CircularProgressIndicator.adaptive(),
              ]
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 24, 0, 15),
              child: Row(
                children: [
                  Image(image: AssetImage('assets/icons/bx_planet.png'), width: 24, height: 24, ),
                  SizedBox(width: 10,),
                  Text("Today's Journey", style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.outfit(fontWeight: FontWeight.w600).fontFamily,
                    fontSize: 24,
                    
                  ),)
                ],
              ),
            ),
            // Container(
            //   child: Card(
            //     color: Color.fromRGBO(38, 50, 105, 1),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(40),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.fromLTRB(13, 13, 0, 8),
            //       child: ListTile(
            //         contentPadding: EdgeInsets.all(0),
            //         leading: Container(
            //           decoration: BoxDecoration(
            //             color: Color.fromRGBO(59, 76, 154, 1),
            //           ),
            //           child: Image(image: AssetImage('assets/icons/codicon_book.png'), width: 50, height: 50, fit: BoxFit.cover,),
            //         ),
            //         title: Text('History Of Space' , style: TextStyle(
            //           color: Colors.white,
            //           letterSpacing: 2,
            //           fontFamily: GoogleFonts.outfit().fontFamily,
            //           fontWeight: FontWeight.w600,
            //           fontSize: 24,
            //         ),),
            //         subtitle: Text('Lesson 1'),
                  
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: 75,
                  color: Color.fromRGBO(38, 50, 105, 1),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(59, 76, 154, 1),
                          borderRadius: BorderRadius.circular(40)
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),                        
                        width: 75,
                        height: 75,
                        child: Image(image: AssetImage('assets/icons/codicon_book.png'), height: 23, width: 23, fit: BoxFit.fill),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("History Of Space", style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.outfit(fontWeight: FontWeight.w600,).fontFamily,
                              
                              fontSize: 24,
                            ),),
                            Text("Lesson 1", style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Mohave',
                              fontSize: 12,
                              letterSpacing: 2,
                            ),),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ),
              ),
              Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: 75,
                  color: Color.fromRGBO(38, 50, 105, 1),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(59, 76, 154, 1),
                          borderRadius: BorderRadius.circular(40)
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),                        
                        width: 75,
                        height: 75,
                        child: Image(image: AssetImage('assets/icons/bx_planet.png'), height: 23, width: 23, fit: BoxFit.fill),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Planets", style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.outfit(fontWeight: FontWeight.w600,).fontFamily,
                              
                              fontSize: 24,
                            ),),
                            Text("Lesson 1", style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Mohave',
                              fontSize: 12,
                              letterSpacing: 2,
                            ),),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ),
              ),
              Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: 75,
                  color: Color.fromRGBO(38, 50, 105, 1),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(59, 76, 154, 1),
                          borderRadius: BorderRadius.circular(40)
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),                        
                        width: 75,
                        height: 75,
                        child: Image(image: AssetImage('assets/icons/moon.png'), height: 23, width: 23, fit: BoxFit.fill),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Moon", style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.outfit(fontWeight: FontWeight.w600,).fontFamily,
                              
                              fontSize: 24,
                            ),),
                            Text("Lesson 1", style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Mohave',
                              fontSize: 12,
                              letterSpacing: 2,
                            ),),
                          ],
                        )
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