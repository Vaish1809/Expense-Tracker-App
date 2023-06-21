import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

//here removed expense was a function is expenses.dart therefore here also we need to create a void function and here we name it onRemoveExpense so tht we can use the function which is being passed from exenses.dart to here
class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
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
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
              //dismissible is used here to delete items when swiped
              key: ValueKey(expenses[index]),
              background: Container(color: Theme.of(context).colorScheme.error.withOpacity(0.50),
              margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              )
              ),
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
              },
              //here we use this key to unniquely identify items and the data associated with it
              child: ExpenseItem(expenses[index]),
            ));
  }
}
