import 'package:expense_05/widget/expense_list/expenses_list.dart';
import 'package:expense_05/model/expenses.dart';
import 'package:expense_05/widget/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void openModalOverlayed() {
    showModalBottomSheet(context: context, builder: (context) => NewExpense());
  }

  final List<Expense> _registered_expenses = [
    Expense(
        title: "movie",
        amount: 22,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: "cinema",
        amount: 33,
        date: DateTime.now(),
        category: Category.work),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: openModalOverlayed, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Text("the chart"),
          Expanded(
            child: ExpensesList(expenses: _registered_expenses),
          ),
        ],
      ),
    );
  }
}
