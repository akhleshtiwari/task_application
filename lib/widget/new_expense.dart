import 'package:expense_05/model/expenses.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  void _submitExpenses() {
    final validAmount = double.tryParse(_amountEditingController.text);
    final amountInvalid = validAmount == null || validAmount <= 0;
    if (_texteditingController.toString().trim().isEmpty ||
        amountInvalid ||
        _selectedDate == null) {}
  }

  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  void _presentDatePicker() async {
    var now = DateTime.now();
    var _firstDate = DateTime(now.year - 1, now.month, now.day);
    var pickedate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: _firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedate;
    });
  }

  final _texteditingController = TextEditingController();
  final _amountEditingController = TextEditingController();

  @override
  void dispose() {
    _texteditingController.dispose();
    _amountEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _texteditingController,
            maxLength: 50,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: "\$ ",
                    label: Text("amount"),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(_selectedDate == null
                        ? "no date selected"
                        : formatdate.format(_selectedDate!)),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              Spacer(),
              ElevatedButton(onPressed: _submitExpenses, child: Text("submit")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("close"))
            ],
          )
        ],
      ),
    );
  }
}
