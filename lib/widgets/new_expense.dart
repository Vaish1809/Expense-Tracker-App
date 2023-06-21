import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
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
//async await is used when we know tht the user wont enter the vslue immn=ediately but it will be available in the future therefore flutter should wait to get that value
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime?
      _selectedDate; //here we use question mark because it can even have null value
  Category _selectedCategory = Category.leisure;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    // final firstDate = DateTime(DateTime.monthsPerYear);//for all dates till today
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    //this part of the code will execute only when picked date has certain value
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  //2 values amount and title
  //title invalid if after timming the extra space if its null
  //amount invalid if its null or if its not a number of type double amd if its less than 0
  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
//try.parse("hello") => null , try.parse("1.12")=> 1.12
    if (_titleController.text.trim().isEmpty ||
        enteredAmount == null ||
        enteredAmount <= 0 ||
        _selectedDate == null) {
      //show eeror msg
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text(
              "Please make sure a valid Amount , Title , Date , Category was selected"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            )
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
          title: _titleController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    //we dispose the controller once the modal is closed or not into function or ekse it would unnecessarily run and keep taking up memory adn will lead to crashing of app
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context)
        .viewInsets
        .bottom; //to show the space taken by the last element here its the keyboard
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.minWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          //to make it scrollable
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          //onChanged: _saveTitleInput,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Text("Title"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        //expannded is used when we have one unconstrained widget inside another unconstrained widget
                        child: TextField(
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
                    ],
                  )
                else
                  
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
                    Expanded(
                      //expannded is used when we have one unconstrained widget inside another unconstrained widget
                      child: TextField(
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
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(_selectedDate == null
                              ? "No Date Selected"
                              : formatter.format(
                                  _selectedDate!,
                                  ),
                                  style: const TextStyle(color: Colors.black),
                                  ), //here we got an error initially tht selectedDate can even have null value but formatter doesnt want null but we have already checked the condtition tht if its null print date not selected therefore we force flutter to believe tht the _selected date wont be null by putting an exclamation mark
                          IconButton(
                            onPressed: _presentDatePicker,
                            icon: const Icon(
                              Icons.calendar_month,color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name.toUpperCase(),selectionColor: Colors.black),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(
                              context); //removes the overlay from the screen
                        },
                        child: const Text("cancel")),
                    ElevatedButton(
                      onPressed: _submitExpenseData,

                      //print(_enteredTitle);
                      //print(_titleController.text);
                      //print(_titleController.text);

                      child: const Text("Save Expense"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
