import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GeneratorPage extends StatefulWidget {
  GeneratorPage({Key key}) : super(key: key);

  @override
  _GeneratorPageState createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  Future<Restaurant> futureRestaurant;

  @override
  void initState() {
    super.initState();
    futureRestaurant = fetchRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Restaurant>(
          future: futureRestaurant,
          builder: (context, snapshot) {
//            if (snapshot.hasData) {
//              return Text(snapshot.data.name);
//            } else if (snapshot.hasError) {
//              return Text("${snapshot.error}");
//            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<Restaurant> fetchRestaurant() async {
  final response = await http.get(
      'https://developers.zomato.com/api/v2.1/search?lat=41.6611&lon=-91.5302&radius=16093.4',
      headers: {
        'Content-Type': 'application/json',
        'user-key': ''
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Restaurant.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Rating {
  final String aggregateRating;
  final String ratingText;
  final String ratingColor;
  final String votes;

  Rating({this.aggregateRating, this.ratingText, this.ratingColor, this.votes});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
        aggregateRating: json['aggregate_rating'],
        ratingText: json["rating_text"],
        ratingColor: json["rating_color"],
        votes: json["votes"]
    );
  }
}

class Restaurant {
  final Rating rating;
  final double reviews;
  final String name;
  final String imageUrl;

  Restaurant({this.name, this.rating, this.reviews, this.imageUrl});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'],
      rating: json['user_rating'],
      reviews: json['all_reviews_count'],
      imageUrl: json['thumb']
    );
  }
}