import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30, vertical: 20
          ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            Row(
               children: [
            Text(
                'INR ${expense.amount.toStringAsFixed(2)}'
                ), //to string fixed is udes whenn we want only a certsin number of digits after decimal
            const Spacer(), //in any column or row it tells flutter to take all the space required for the upper and the the lower widget in the code
            //its basically used it we want text in a row to placced left aligned and one text right alined
            //here it will ledft align the text and right alignt he row
            
           
               Icon(categoryIcons[expense.category]),
                const SizedBox(width: 8),
                Text(expense.fromattedDate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
