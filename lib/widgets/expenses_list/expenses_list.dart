import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses});
final List<Expense> expenses;
@override
  Widget build(BuildContext context) {
   
    //column vs ListView
    //column is used when we have large amounnt of widgets that needs to placed one below each other but its not scrollable and as soon aa the column is run it builds all its widgets at once
    //but at an instant on the screen all the widgets are not visible therefore we dont require this 
    //List View is an advanced version of column creates a by defalut scrollable list 
    ////using a builder function/method with it it creates only those widgets at once whicha re going to be visible hence its kinda dynnamic 
   //************* */
   //ways to write a function
   //1-function name(parameters){function body}
//2- initialize it on top -function name(parameters){function body}
//and then when we want to call jsut passs pointer ie function name
   //3-when the function body is small enough -function name(parameters) => function body 
   return  ListView.builder( itemCount: expenses.length,itemBuilder: (context, index) => ExpenseItem(expenses[index]));
  }

}