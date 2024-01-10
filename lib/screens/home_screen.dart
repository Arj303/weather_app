import'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../models/weatherModels.dart';
import '../services/api.dart';
import 'package:lottie/lottie.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Weather? model;


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Weather fetchedModel = await WeatherData.fetchData();
      setState(() {
        model = fetchedModel;
      });
      print('country : ${model?.location.country}');
    } catch (e) {
      print('Error fetching data: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(color: Colors.black38,fontSize: 30),
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Container(
              child: Center(
                  child: Column(
                    children: [
                    Text(model!.location.name),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(model!.location.region),
                          Text(", "),
                          Text(model!.location.country),
                        ],

                      ),
                    



                ],
              )
              ),




              ),

            SizedBox(height: 50,),
            Container(
              child:
              Image.network(
                "http:"+model!.current.condition.icon,
                width: 150,
                height: 150,fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 50,),
            Container(
             child:  Column(
               children: [
                 

                     Text(model!.current.tempC.toString()+ " \u2103",style: TextStyle(fontFamily: GoogleFonts.aBeeZeeTextTheme.toString(),
                     fontSize: 70,)
                     ),



                 
                 SizedBox(
                   height: 100,
                 ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [


                     Text('Wind', style: GoogleFonts.notoSans()),
                     Text(" - "),
                     Text(model!.current.gustKph.toString()),
                     Text(" "),
                     Text("kph"),
                     SizedBox(
                       width: 20,
                     ),
                     Text('Humidity', style: GoogleFonts.notoSans()),
                     Text(" - "),
                     Text(model!.current.humidity.toString()),



                   ],
                 ),

               ],
             ),
            )
          ],
        ),
      )


    );
  }
}
