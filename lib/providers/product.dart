import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  Product({
    @required this.description,
    @required this.id,
    @required this.imageUrl,
    @required this.price,
    @required this.title,
    this.isFavorite = false,
  });
  void toggleFavoriteStatus() {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    http.patch();
  }
}
