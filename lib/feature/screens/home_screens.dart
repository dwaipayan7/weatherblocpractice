import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            )
          ],
        ),
        ),
      ),
    );
  }
}