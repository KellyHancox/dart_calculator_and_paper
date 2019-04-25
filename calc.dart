import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:hello_world/app_component.template.dart' as ng;
import 'dart:html';
import 'dart:io';



addition( double currVal, double newVal ){
  return currVal + newVal;
}

subtraction (double currVal, double newVal){
  return currVal - newVal;
}

multiplication( double currVal, double newVal){
  return currVal * newVal;
}

division(double currVal, double newVal){
  try{
    return currVal/newVal;
  }
  on IntegerDivisionByZeroException {
    print('Cannot divide by zero');
  }
}


Future main() async {
  runApp(ng.AppComponentNgFactory);


  print('Please enter value to start');

  double currVal = stdin.readLineSync(encoding: Encoding.UTF_8);

  print('Now please enter a mathematical symbol (+, -, *, /) followed by \n'
      'a number to add, subtract, multiply or divide with your current number.\n '
      'Enter \'quit\' to quit');

  var line = stdin.readLineSync(encoding: Encoding.UTF_8);

  var splitLine = const [];
  splitLine = line.split(" ");
  var symbol = splitLine[0];
  var secondVal = splitLine[1];

  while(line != 'quit') {

    switch (symbol) {
      case "+":
        {
          currVal = addition(currVal, secondVal);
        }
        break;

      case "-":
        {
          currVal = subtraction(currVal, secondVal);
        }
        break;

      case "*":
        {
          currVal = multiplication(currVal, secondVal);
        }
        break;

      case "/":
        {
          currVal = division(currVal, secondVal);
        }
        break;

      default:
        {
          print("Please input a legitimate statement");
        }
        break;
    }

    print('Now please enter a mathematical symbol (+, -, *, /) followed by \n'
        'a number to add, subtract, multiply or divide with your current number.\n '
        'Enter \'quit\' to quit');

    line = stdin.readLineSync(encoding: Encoding.UTF_8);

    splitLine = line.split(" ");
    symbol = splitLine[0];
    secondVal = splitLine[1];
  }

  print('Now exiting program');
  exit(1);

}
