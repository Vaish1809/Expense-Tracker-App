import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      amount: 19.34,
      category: Category.work,
      date: DateTime.now(),
      title: "vaish",
    ),
    Expense(
      amount: 19.34,
      category: Category.food,
      date: DateTime.now(),
      title: "Flower",
    ),
    Expense(
      amount: 19.34,
      category: Category.travel,
      date: DateTime.now(),
      title: "abstract",
    ),
  ];
  //context its the metadata provided by flutter which has info abt the widgets and position of widgets in ui tree
  void _openAddExpensesOverlay(){
showModalBottomSheet(context: context, builder: (ctx) =>const  NewExpense(),
);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: const Text("Expense Tracker App"),
        actions: [
        IconButton(onPressed:_openAddExpensesOverlay,
         icon: const Icon(Icons.add),),
      ],
      ),
      
      body: Column(
        children: [
          const Text("the chart"),
          //here we have a column and in tht column we call Expenses list which is also a column
          //so when we have column insie a column flutter doesnst know how to size it thereofre use expanded
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
