import 'package:expense_tracker_app/widgets/chart.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/chart.dart';
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
  void _openAddExpensesOverlay() {
    showModalBottomSheet(
      useSafeArea: true,//used to detect the safe areas or avoid cameras or anything which is overlapping
      isScrollControlled: true,//this simply means tht when we press + it will occupy the entire screen
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _remvoveExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    //this is to show a message or snack bar once we delete a certain expense
   //to clear all the other snackbars we use .clearSnackBars
   ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: (){
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });

          },
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
 final width = MediaQuery.of(context).size.width;
   
    Widget mainContent = const Center(
      child: Text("No Expenses. Add Some"),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _remvoveExpense,
            );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker App"),
        actions: [
          IconButton(
            onPressed: _openAddExpensesOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width <600 ? 
      Column(
        children: [
          Chart(expenses:_registeredExpenses ),
          //here we have a column and in tht column we call Expenses list which is also a column
          //so when we have column insie a column flutter doesnst know how to size it thereofre use expanded
          Expanded(
            child: mainContent,
          ),
        ],
      )
: Row(
  children: [
Expanded
(child: Chart(expenses:_registeredExpenses ),
),
          //here we have a column and in tht column we call Expenses list which is also a column
          //so when we have column insie a column flutter doesnst know how to size it thereofre use expanded
          Expanded(
            child: mainContent,
          ),
],)
    );
  }
}
