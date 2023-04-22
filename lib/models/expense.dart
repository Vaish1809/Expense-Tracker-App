import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
const uuid = Uuid();//uuid class is provovded by uuid package
//just to store tht which type of data should be grouped 

final formatter =DateFormat.yMd();
enum Category { food , travel , leisure,work}
const categoryIcons = {
Category.food:Icons.lunch_dining,
Category.leisure:Icons.movie,
Category.travel: Icons.flight,
Category.work:Icons.work,
};

///in categroy we have a fixed options only so giving it a string is risky as then it will accept any string
//therefore we create our own list of values using enum  
//An enumeration is used for defining named constant values. An enumerated type is declared using the enum keyword. Syntax. enum enum_name { enumeration list }.
class Expense{
 Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    })  : id = uuid.v4() ;//here this uuid ois created and added 
final String id;//unique string for every id for identification
final String title;
final double amount ;
final DateTime date;
final Category category;
//Getter and setter methods are the class methods used to manipulate the data of the class fields. Getter is used to read or get the data of the class field whereas setter is used to set the data of the class field to some variable.
//t is used to retrieve a particular class field and save it in a variable. All classes have a default getter method but it can be overridden explicitly. 

String get fromattedDate{
  return formatter.format(date);
}

}