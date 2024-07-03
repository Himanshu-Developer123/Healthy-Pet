import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../router.dart';

class SplashPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<SplashPage> createState() => SplashState();

}

class SplashState extends ConsumerState<SplashPage>{
  
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),
            ()=> context.goNamed(AppRoute.login.name)
            );
  }
  
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromRGBO(129, 138, 249, 1),
      body: Stack(
        children: [
          Positioned(
            top: size.height * 0.1,
              right: 0,
              left: 0,
              child: SvgPicture.asset('assets/splash/heading.svg')
          ),
          Positioned(
              top: size.height * 0.20,
              right: 40,
              left: 40,
              child: RichText(
                // Controls visual overflow
                overflow: TextOverflow.clip,
                // Controls how the text should be aligned horizontally
                textAlign: TextAlign.center,
                // Control the text direction
                // textDirection: TextDirection.rtl,
                // Whether the text should break at soft line breaks
                softWrap: true,
                // Maximum number of lines for the text to span
                // maxLines: 1,
                // The number of font pixels for each logical pixel
                textScaleFactor: 1,
                text: const TextSpan(
                  text: 'Helping you \n',
                  style: TextStyle(fontSize: 32,height: 1.3,color: Color.fromRGBO(223, 226, 255, 1)),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'to keep '),
                    TextSpan(
                        text: 'your bestie', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
                    TextSpan(
                        text: ' stay healthy!'),
                  ],
                ),
          ),),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset('assets/splash/puppy.png')),
          Positioned(
              bottom: size.height * 0.340,
              right: size.width * 0.07,
              // left: size.width * 0.180,
              child: SvgPicture.asset('assets/splash/e2.svg')
          ),
          Positioned(
              bottom: size.height * 0.340,
              // right: 0,
              left: size.width * 0.180,
              child: SvgPicture.asset('assets/splash/e1.svg')
          ),
          Positioned(
              bottom: size.height * 0.3,
              // right: size.width * 0.07,
              left: size.width * 0.180,
              child: SvgPicture.asset('assets/splash/e3.svg')
          ),
        ],
      ),
    );
  }

}