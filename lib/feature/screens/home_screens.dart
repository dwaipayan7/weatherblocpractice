import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherblocpractice/main.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
        ),
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(3, -0.3),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-3, -0.3),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -1.2),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.orange
                ),
              ),
            ),
            BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 100, sigmaY: 100,
                ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const Text(
                      '📍 Aix-en-Provence',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  const SizedBox(height: 8,),
                  const Text(
                    "Good Morning",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Image.asset(
                    'assets/1.png'
                  ),
                  const Center(
                    child: Text(
                      '24°C',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  const SizedBox(height: 4,),
                  const Center(
                    child: Text(
                      'THUNDERSTORM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Center(
                    child: Text(
                      'Wednesday 23 • 15:42',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                  SizedBox(height: 28,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/11.png',
                            scale: 8,
                          ),
                          SizedBox(width: 5,),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sunrise", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300
                              ),
                              ),
                              SizedBox(height: 3,),
                              Text(
                                '5:34 am',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/12.png',
                            scale: 8,
                          ),
                          SizedBox(width: 5,),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sunset", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300
                              ),
                              ),
                              SizedBox(height: 3,),
                              Text(
                                '5:34 pm',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                ),
                              )
                            ],
                          )
                        ],
                      ),

                    ],
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Divider(
                    color: Colors.grey,
                  ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/13.png',
                            scale: 8,
                          ),
                          SizedBox(width: 5,),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Temp Max", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300
                              ),
                              ),
                              SizedBox(height: 3,),
                              Text(
                                '28°C',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/14.png',
                            scale: 8,
                          ),
                          SizedBox(width: 5,),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Temp Min", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300
                              ),
                              ),
                              SizedBox(height: 3,),
                              Text(
                                '21°C',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                ),
                              )
                            ],
                          )
                        ],
                      ),

                    ],
                  ),


                ],
              ),
            )
          ],
        ),
        ),
      ),
    );
  }
}
