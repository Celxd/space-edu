import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'apodModel.dart';
import 'model.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  apodModel? _apodModel;
  bool isloaded = false;
  final thisisUri = Uri.parse("https://api.nasa.gov/planetary/apod?api_key=IcbWbmCcUpgThyyXOEbUcnojCbyYAWqMVrFJhanO");
  List resBody = [];
  String imageUrl = "";
  String imageUrl1 = "";
  String imageTitle = "";
  String imgTest = "aeghh ";

  // Future<String> getAPODData() async{
  //   var res = await http
  //   .get(theweb, headers: {"Accept": "application/json"});

  //   var resBody = json.decode(res.body);
  //   imageUrl = resBody["hdurl"].toString();
  //   print(resBody["hdurl"]);
  //   imageTitle = resBody["title"];
  //   return "Success!!";
  // }


  // Future<List<apodModel>> fetchApod() async {
  //   var response = await http.get(Uri.parse(uri));

  //   if (response.statusCode == 200) {
  //     final jsonList = json.decode(response.body);

  //     if(jsonList is List) {
  //       return jsonList.map((json) => apodModel.fromJson(json)).toList();
  //     }
  //   }
  //   throw Exception('Failed to load data');
  // }

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
    super.initState();
    // this.getAPODData();
    // _apodModel = fetchAPOD() as apodModel?;
    // imgTest = fetchIMG().toString();
    getApod();
  }
  



  // Future<String> fetchIMG() async {
  //   final response = await http
  //       .get(Uri.parse('https://api.nasa.gov/planetary/apod?api_key=IcbWbmCcUpgThyyXOEbUcnojCbyYAWqMVrFJhanO'));

  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     print(apodModel.fromJson(jsonDecode(response.body)).hdurl);
  //     print(apodModel.fromJson(jsonDecode(response.body)).hdurl.toString());
  //     return apodModel.fromJson(jsonDecode(response.body)).hdurl.toString();
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // _apodModel = getApod() as apodModel?;
  //   // _apodModel = fetchAPOD() as apodModel?;
  //   // final model = fetchAPOD();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(21, 30, 86, 1),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.network(_apodModel!.hdurl.toString()),
              // imageUrl.isNotEmpty ? Image.network(imageUrl) : Container(child: Text('GAGAL'),),
              // Text("https://"+imageTitle)
            ],
          ),
          // child: Container(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Container(
          //         child: Flexible(
          //           child: Stack(
          //             children: <Widget>[
          //               Positioned(
          //                 top: 0,
          //                 left: 0,
          //                 child: Container(
          //                   width: 338,
          //                   height: 213,
          //                   decoration: BoxDecoration(
                              // borderRadius : BorderRadius.only(
                              //   topLeft: Radius.circular(40),
                              //   topRight: Radius.circular(40),
                              //   bottomLeft: Radius.circular(40),
                              //   bottomRight: Radius.circular(40),
                              // ),
          //                     image : DecorationImage(
          //                       image: AssetImage('assets/images/apod.jpg'),
          //                       fit: BoxFit.fitWidth
          //                     ),
          //                   ),
          //                 ),
          //               ), 
          //               Positioned(
          //                 top: 30,
          //                 left: 30,
          //                 child: Text('Picture of the day', textAlign: TextAlign.left, style: TextStyle(
          //                   color: Color.fromRGBO(255, 255, 255, 1),
          //                   fontFamily: 'Mohave',
          //                   fontSize: 16,
          //                   letterSpacing: 2,
          //                   fontWeight: FontWeight.normal,
          //                   height: 1
          //                 ),)
          //               ),
          //               Positioned(
          //                 top: 183,
          //                 left: 254,
          //                 child: Text('17,8,2000', textAlign: TextAlign.left, style: TextStyle(
          //                   color: Color.fromRGBO(255, 255, 255, 1),
          //                   fontFamily: 'Mohave',
          //                   fontSize: 12,
          //                   letterSpacing: 2,
          //                   fontWeight: FontWeight.normal,
          //                   height: 1
          //                 ),)
          //               ),
          //               Positioned(
          //                 top: 183,
          //                 left: 20,
          //                 child: Text('By:Robert William', textAlign: TextAlign.left, style: TextStyle(
          //                   color: Color.fromRGBO(255, 255, 255, 1),
          //                   fontFamily: 'Mohave',
          //                   fontSize: 12,
          //                   letterSpacing: 2,
          //                   fontWeight: FontWeight.normal,
          //                   height: 1
          //                 ),)
          //               ),
          //             ]
          //           ),
          //         )
          //       )
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}