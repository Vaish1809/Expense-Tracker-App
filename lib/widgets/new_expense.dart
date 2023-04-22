import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
//var _enteredTitle = '';
//void _saveTitleInput(String inputValue)
// {
//   _enteredTitle=inputValue;
// }
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    //we dispose the controller once the modal is closed or not into function or ekse it would unnecessarily run and keep taking up memory adn will lead to crashing of app
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            //onChanged: _saveTitleInput,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(child: TextField(
                controller: _amountController,
                //onChanged: _saveTitleInput,
                keyboardType: TextInputType.number,
                // maxLength: 10,
                decoration: const InputDecoration(
                  prefixText: "INR  ",
                  label: Text("Amount"),
                ),
              ),
              ),
            const SizedBox(width: 16,),
            Expanded(child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Sected Date"),
                IconButton(
                  onPressed: (){},
                  icon:const Icon(Icons.calendar_month,
                  ),
                  )
              ],
            ),
            ),
            ],
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(
                        context); //removes the overlay from the screen
                  },
                  child: const Text("cancel")),
              ElevatedButton(
                onPressed: () {
                  //print(_enteredTitle);
                  print(_titleController.text);
                  print(_titleController.text);
                },
                child: const Text("Save Expense"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
