import 'dart:io';

void main() {
  stdout.write("\nPlease Enter Integer Number: ");
  int inputNumber = 0;
  inputNumber = int.parse(stdin.readLineSync()!);

  if (inputNumber >= 0 && inputNumber % 2 == 0) {
    print("This Number $inputNumber is Postive Even Number."'\n');
  } else if (inputNumber >= 0 && inputNumber % 2 != 0) {
    print("This Number $inputNumber is Postive Odd Number."'\n');
  } else if (inputNumber < 0 && inputNumber % 2 == 0) {
    print("This Number $inputNumber is Negative Even Number."'\n');
  } else {
    print("This Number $inputNumber is Negative Odd Number."'\n');
  }
}
