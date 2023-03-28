import 'dart:convert'; 
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/data/model/favorite_model.dart';
import 'package:weather_app/features/favorite/favorite_weather_details.dart';

import '../../shared/utils/palette.dart';
  
class FavoriteWeather extends StatefulWidget {
  static const routeName = 'FavoriteWeather';

    const FavoriteWeather({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteWeather> createState() => _FavoriteWeatherState();
}

class _FavoriteWeatherState extends State<FavoriteWeather> {
     @override
  void initState(){
    initalGetSaveData();
    super.initState();
    
  } 
    List<FavoriteModel> favoriteList =[];
   late final SharedPreferences sharedPreferences;

   void initalGetSaveData() async{
        sharedPreferences = await SharedPreferences.getInstance();
       Map<String,dynamic> jsonFavorite = jsonDecode(sharedPreferences.getString('favorite')!); 
        favoriteList.add(FavoriteModel(address: jsonFavorite['address'], longitude: jsonFavorite['longitude'], latitude: jsonFavorite['latitude'], temp: jsonFavorite['temp'], weather: jsonFavorite['weather']));
         
  }
   Future<List<FavoriteModel>> getData() async{
    await Future.delayed(
      const Duration(seconds:2),
    );
    
    return favoriteList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite")),
      body: FutureBuilder<List<FavoriteModel>>(
          future: getData(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? const CircularProgressIndicator()
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(snapshot.data!.length,
                      (index) {
                return  Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Palette.white,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [ 
                            Text(
                              favoriteList[index].address,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.green[900],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 100, 
                              child: ElevatedButton(
                                onPressed: () =>  Navigator.pushNamed( context, FavoriteWeatherDetails.routeName,arguments: {
                                  'address': favoriteList[index].address,
                                  'latitude': favoriteList[index].latitude,
                                  'longitude': favoriteList[index].longitude,
                                  'temp': favoriteList[index].temp,
                                  'weather': favoriteList[index].weather,
                                  }),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.touch_app),
                                      Text('View'),
                                    ],
                                  ),
                                ),
                              ),  
                            ), //SizedBox
                          ],
                        ), //Column
                      ), //Padding
                    ), //SizedBox
                  );
           
                      },
              ),
            );
          },
        ),
        
    );
  }
}

 