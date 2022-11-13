import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_edu/loginPage.dart';
import 'package:space_edu/signPage.dart';

class getStarted extends StatefulWidget {     const getStarted({super.key});

  @override
  State<getStarted> createState() => _getStartedState();
}

class _getStartedState extends State<getStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 25, 52, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 48, 10, 30),
              width: double.infinity,
              child: Image(image: AssetImage('assets/images/getStarted.png'), fit: BoxFit.fitWidth,),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: RichText(text: TextSpan(
                style: TextStyle(
                  fontFamily: GoogleFonts.outfit(fontWeight: FontWeight.bold).fontFamily,
                  fontSize: 30,
                  color: Colors.white,
                  letterSpacing: 0,
                ),
                children: const <TextSpan>[
                  TextSpan(text: "Discover ", style: TextStyle(color: Color.fromRGBO(88, 172, 221, 1))),
                  TextSpan(text: "More\n"),
                  TextSpan(text: "About The "),
                  TextSpan(text: "Universe", style: TextStyle(color: Color.fromRGBO(88, 172, 221, 1)))
                ]
              ),
              textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(29, 0, 29, 50),
              child: Text("~The more clearly we can focus our attention on the wonders and realities of the universe about us, the less taste we shall have for destruction~\n― Rachel Carson",
                style: TextStyle(
                  fontFamily: GoogleFonts.outfit(fontWeight: FontWeight.w300).fontFamily,
                  fontSize: 13,
                  color: Colors.white,
                  letterSpacing: 0
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 15,
                    height: 65,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => signPage()));
                      },
                      child: Text("Sign In", style: TextStyle(
                        fontFamily: GoogleFonts.outfit(fontWeight: FontWeight.bold).fontFamily,
                        fontSize: 22,
                        color: Colors.white,
                      ),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(88, 172, 221, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(0),
                          ),
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 15,
                    height: 65,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage()));
                      },
                      child: Text("Login", style: TextStyle(
                        fontFamily: GoogleFonts.outfit(fontWeight: FontWeight.bold).fontFamily,
                        fontSize: 22,
                        color: Colors.white,
                      ),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(38, 50, 105, 1),
                        padding: EdgeInsets.fromLTRB(46, 18, 46, 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(15),
                          ),
                        )
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}