import 'package:equatable/equatable.dart';

// class RestoModel extends Equatable {
//   bool? error;
//   String? message;
//   int? count;
//   List<Restaurants>? restaurants;

//   RestoModel({this.error, this.message, this.count, this.restaurants});

//   factory RestoModel.fromJson(Map<String, dynamic> json) => RestoModel(
//     error : json['error'],
//     message : json['message'],
//     count : json['count'],
//     if (json['restaurants'] != null) {
//       restaurants = <Restaurants>[];
//       json['restaurants'].forEach((v) {
//         restaurants!.add(new Restaurants.fromJson(v));
//       });
//     }
//   );

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['error'] = this.error;
//     data['message'] = this.message;
//     data['count'] = this.count;
//     if (this.restaurants != null) {
//       data['restaurants'] = this.restaurants!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }

//   @override
//   List<Object> get props => [];
// }

// class Restaurants extends Equatable {
//   String id;
//   String name;
//   String description;
//   String pictureId;
//   String city;
//   double rating;

//   Restaurants({
//     this.id = '',
//     this.name = '',
//     this.description = '',
//     this.pictureId = '',
//     this.city = '',
//     this.rating = 0.0,
//   });

//   factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
//         id: json['id'],
//         name: json['name'],
//         description: json['description'],
//         pictureId: json['pictureId'],
//         city: json['city'],
//         rating: json['rating'],
//       );

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['pictureId'] = this.pictureId;
//     data['city'] = this.city;
//     data['rating'] = this.rating;
//     return data;
//   }

//   @override
//   List<Object> get props => [
//         id,
//         name,
//         description,
//         pictureId,
//         city,
//         rating,
//       ];
// }

class RestaurantModel {
  RestaurantModel({
    required this.error,
    required this.massage,
    required this.count,
    required this.restaurants,
  });

  bool error;
  String massage;
  int count;
  List<Restaurants> restaurants;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
          error: json['error'],
          massage: json['message'],
          count: json['count'],
          restaurants: List<Restaurants>.from((json['restaurants'] as List)
              .map((x) => Restaurants.fromJson(x))
              .where(
                (restaurants) =>
                    restaurants.id != null &&
                    restaurants.name != null &&
                    restaurants.description != null &&
                    restaurants.pictureId != null &&
                    restaurants.city != null &&
                    restaurants.ratings != null,
              )));
}

class Restaurants {
  Restaurants({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.ratings,
  });
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  num? ratings;

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        ratings: json['rating'],
      );
}
