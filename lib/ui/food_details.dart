import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetails extends StatelessWidget {
  final foodname, foodPrice, imgPath;
 const FoodDetails(this.foodname, this.foodPrice, this.imgPath);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/icons/menu.svg",
                    width: 20,
                  ),
                  Stack(
                      alignment: Alignment.centerLeft,
                      children: <Widget>[
                        SizedBox(height: 5),
                       CircleAvatar(
                         backgroundColor: Colors.redAccent,
                          child: Icon(Icons.shopping_cart,
                              color: Colors.white, size: 20),
                        ),
                        Positioned(
                            top: 0,
                            left: 30,
                            child: Container(
                              height: 18,
                              width: 18,
                              child: Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                            ))
                      ])
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                 
                  SizedBox(
                    width: 100,
                    child: Text(foodname.toUpperCase(),
                        style: GoogleFonts.oswald(
                            fontSize: 24.0, fontWeight: FontWeight.w700)),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'FROM',
                        style: GoogleFonts.juliusSansOne(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '\$$foodPrice',
                        style: GoogleFonts.oswald(
                            fontSize: 20.0, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Hero(
                  tag: foodname,
                  child: Container(height: size.height*0.4, child: Image.asset(imgPath))),
              Center(
                  child: Text(
                'Size',
                style: GoogleFonts.openSans(
                    fontSize: 16, fontWeight: FontWeight.bold),
              )),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      'S',
                      style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26),
                    ),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              spreadRadius: 0)
                        ]),
                  ),
                  SizedBox(width: 15),
                  Container(
                    child: Text(
                      'M',
                      style: GoogleFonts.juliusSansOne(
                       
                          decorationThickness: 25,
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 1.5)
                        ]),
                  ),
                  SizedBox(width: 15),
                  Container(
                    child: Text('L',
                        style: GoogleFonts.openSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black26)),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(1),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              spreadRadius: 0)
                        ]),
                  ),
                ],
              ),
              SizedBox(height: 30),
              DefaultTextStyle(
                  style: GoogleFonts.openSans(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                  child: Column(
                    children: <Widget>[
                      Text('Our Angry WHOPPER features 1/2 lb* of '),
                      Text('flame-grilled beef,piled high with thick-'),
                      Text('-cut bacon,American cheese')
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
