import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<StatefulWidget> createState() => DetailsPageState();

}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 10, 10, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0,right: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.1,),
            const Text('add personal details',style: TextStyle(fontFamily: 'Roboto',color: Colors.white,fontSize: 22),),
            Container(
              padding: const EdgeInsets.only(top: 5),
                width: size.width * 0.6,
                child: const Text('helps to verify your identity during account recovery',style: TextStyle(fontFamily: 'Roboto',color: Colors.white,fontSize: 12),)
            ),
            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: SvgPicture.asset('assets/login/trailing-icon.svg',),
                      ),
                      hintText: 'Display Name',
                      hintStyle: const TextStyle(fontSize: 14,color: Color.fromRGBO(255, 251, 255, 1)),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 0)
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10,top:8.0),
                    child: Text('visible to everyone',
                      style: TextStyle(fontFamily: 'Roboto',fontSize: 12,
                          color: Color.fromRGBO(255, 251, 255, 1),
                          fontWeight: FontWeight.w300),),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top:30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(

                      hintText: 'Date of birth',
                      hintStyle: TextStyle(fontSize: 14,color: Color.fromRGBO(255, 251, 255, 1)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 0)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10,top:8.0),
                    child: Text('dd-mm-yyyy',
                      style: TextStyle(fontFamily: 'Roboto',fontSize: 12,
                          color: Color.fromRGBO(255, 251, 255, 1),
                          fontWeight: FontWeight.w300),),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top:30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Gender',
                      hintStyle: TextStyle(fontSize: 14,color: Color.fromRGBO(255, 251, 255, 1)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 0)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              width: size.width,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(74, 68, 88, 1),
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                ),
                child: const Text('AGREE & CONTINUE',style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto'),),
              ),
            )
          ],
        ),
      ),
    );
  }

}