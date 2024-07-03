import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../repository/auth_service.dart';


class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        // color: Colors.pink,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            // stops: [0, 0.34, 0.47, 0.57,0.70,0.70,1],
            stops: [0, 0.24, 0.37, 0.47,0.60,0.60,1],
              colors: [
                Color.fromRGBO(23, 23, 23, 1),
                Color.fromRGBO(31, 0, 28, 1),
                Color.fromRGBO(28, 12, 27, 1),
                Color.fromRGBO(25, 22, 26, 1),
                Color.fromRGBO(55, 3, 64, 1),
                Color.fromRGBO(59, 0, 69, 1),
                Color.fromRGBO(23, 23, 23, 1)
              ],

          )
        ),
        child: Column(
          children: [


            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30.0,bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom:8.0),
                    child: Text('Username',style: TextStyle(fontSize: 12,color: Color.fromRGBO(164, 164, 164, 1)),),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset('assets/login/user_logo.svg',width: 1,),
                      ),
                      hintText: 'Username',
                      hintStyle: const TextStyle(fontSize: 12,color: Color.fromRGBO(164, 164, 164, 1)),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom:8.0),
                    child: Text('Password',style: TextStyle(fontSize: 12,color: Color.fromRGBO(164, 164, 164, 1)),),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset('assets/login/key_logo.svg',width: 1,),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset('assets/login/eye_logo.svg',width: 1,),
                      ),
                      hintText: '*******',
                      hintStyle: const TextStyle(fontSize: 12,color: Color.fromRGBO(164, 164, 164, 1)),
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
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: SizedBox(
                      width: size.width,
                        child: const Text('Forgot your password?',textAlign: TextAlign.end,style: TextStyle(fontSize:12,color: Color.fromRGBO(164, 164, 164, 1)),)),
                  ),
                  SizedBox(height: size.height*0.02,)
                ],
              ),
            ),
            SizedBox(height: size.height*0.05,),
            Container(
              margin: EdgeInsets.only(left: 30,right: 30,bottom: size.height * 0.02),
              width: size.width,
              // height:100,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0, 1],
                  colors: [
                    Color.fromRGBO(156, 63, 228, 1),
                    Color.fromRGBO(198, 86, 71, 1),
                  ],
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ElevatedButton(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                ),
                child: const Text('Sign in',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto'),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom:size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/login/left1.svg'),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0,right: 8),
                    child: Text('Or continue with',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color.fromRGBO(182, 182, 182, 1)),),
                  ),
                  SvgPicture.asset('assets/login/right1.svg')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom:size.height * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      await ref.read(authServiceProvider).signInWithGoogle();
                    },
                    child: Container(
                      width: 58,
                      height: 44,
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0,0.7, 1],
                              colors: [
                                Color.fromRGBO(255, 255, 255, 1),
                                Color.fromRGBO(255, 255, 255, 0.22),
                                Color.fromRGBO(255, 255, 255, 1),
                              ],
                            ),
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset('assets/login/google_logo.svg'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 58,
                    height: 44,
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0,0.7, 1],
                            colors: [
                              Color.fromRGBO(255, 255, 255, 1),
                              Color.fromRGBO(255, 255, 255, 0.22),
                              Color.fromRGBO(255, 255, 255, 1),
                            ],
                          ),
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset('assets/login/apple_logo.svg'),
                      ),
                    ),
                  ),
                  Container(
                    width: 58,
                    height: 44,
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0,0.7, 1],
                            colors: [
                              Color.fromRGBO(255, 255, 255, 1),
                              Color.fromRGBO(255, 255, 255, 0.22),
                              Color.fromRGBO(255, 255, 255, 1),
                            ],
                          ),
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset('assets/login/facebook_icon.svg'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}