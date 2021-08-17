import 'dart:convert';

import 'package:bonybom_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryNotifier with ChangeNotifier {
  List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;
  bool _loading = false;
  bool get loading => _loading;

  getCategories() async {
    _loading = true;
    var url = Uri.parse(
        "https://bonybom.com/api/?page=kategoriler&apiKey=DBF221ACCF5367983F219457BFB9D8C1F9059F1B");
    var response = await http.get(url);

    List result = json.decode(response.body);
    //print(response.body);
    _categories = result.map((e) => CategoryModel.fromJson(e)).toList();

    _loading = false;

    notifyListeners();
  }
}
