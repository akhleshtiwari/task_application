import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Category { travel, leisure, food, work }

var uuid = const Uuid();

var categoryIcons = {
  Category.travel: const Icon(Icons.fire_truck_sharp),
  Category.food: const Icon(Icons.lunch_dining_rounded),
  Category.leisure: const Icon(Icons.home),
  Category.work: const Icon(Icons.work)
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String title;
  final String id;
  final double amount;
  final DateTime date;
  final Category category;
}
