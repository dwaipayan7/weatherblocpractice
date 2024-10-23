import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherblocpractice/feature/bloc/weather_bloc.dart';
import 'package:weatherblocpractice/main.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {

String greeting = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WeatherBloc>().add(FetchWeather());
    updateGreeting();
  }

  void updateGreeting(){
    final hour = DateTime.now().hour;
    if(hour < 12){
      setState(() {
        greeting = "Good Morning";
      });
      if(hour < 17){
        setState(() {
          greeting = "Good Afternoon";
        });
      }else{
        setState(() {
          greeting = "Good Evening";
        });
      }
    }
  }

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
            BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {

              if(state is WeatherSuccess){
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          '📍 ${state.weather.areaName}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        const SizedBox(height: 8,),
                         Text(
                          greeting,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 4,),
                        
                        getWeatherIcon(state.weather.weatherConditionCode!),
                        // Image.asset(
                        //     'assets/1.png'
                        // ),
                         Center(
                          child: Text(
                            '${state.weather.temperature!.celsius!.round()}°C',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 55,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        const SizedBox(height: 4,),
                         Center(
                          child: Text(
                            '${state.weather.weatherMain!.toUpperCase()}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                         Center(
                          child: Text(
                            DateFormat('EEEE dd •').add_jm().format(state.weather.date!),
                            // 'Wednesday 23 • 15:42',
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
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Sunrise", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300
                                    ),
                                    ),
                                    SizedBox(height: 3,),
                                    Text(
                                      DateFormat().add_jm().format(state.weather.sunset!),
                                      // '5:34 am',
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
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Sunset", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300
                                    ),
                                    ),
                                    SizedBox(height: 3,),
                                    Text(
                                      DateFormat().add_jm().format(state.weather.sunrise!),
                                      // '5:34 pm',
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
                        const Padding(padding: EdgeInsets.symmetric(vertical: 5.0),
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
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Temp Max", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300
                                    ),
                                    ),
                                    SizedBox(height: 3,),
                                    Text(
                                      '${state.weather.tempMax!.celsius!.round()}°C',
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
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Temp Min", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300
                                    ),
                                    ),
                                    SizedBox(height: 3,),
                                    Text(
                                      '${state.weather.tempMin!.celsius!.round()}°C',
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
                  ),
                );
              }
              if(state is WeatherLoading){
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if(state is WeatherFailure){
                return Text("Getting errors");
              }

              return Container();
  },
)
          ],
        ),
        ),
      ),
    );
  }


  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300 :
        return Image.asset(
            'assets/1.png'
        );
      case >= 300 && < 400 :
        return Image.asset(
            'assets/2.png'
        );
      case >= 500 && < 600 :
        return Image.asset(
            'assets/3.png'
        );
      case >= 600 && < 700 :
        return Image.asset(
            'assets/4.png'
        );
      case >= 700 && < 800 :
        return Image.asset(
            'assets/5.png'
        );
      case == 800 :
        return Image.asset(
            'assets/6.png'
        );
      case > 800 && <= 804 :
        return Image.asset(
            'assets/7.png'
        );
      default:
        return Image.asset(
            'assets/7.png'
        );
    }
  }
}
