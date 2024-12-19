import 'dart:io';

void main() {
  const double Tax = 0.1;
  double totalPrice = 0;
  double totalPriceAfterTax = 0;
  List<Map<String, double>> groceryItems = [];

  stdout.write("Enter the number of grocery items: ");
  int groceryItemslenght = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= groceryItemslenght; i++) {
    stdout.write("please Enter Name of Item $i of grocery items: ");
    String ItemName = stdin.readLineSync()!;

    stdout.write("please Enter Price of Item $i of grocery items: ");
    double ItemPrice = double.parse(stdin.readLineSync()!);

    Map<String, double> groceryItem = {ItemName: ItemPrice};
    groceryItems.add(groceryItem);
  }

  for (var item in groceryItems) {
    totalPrice += item.values.first;
  }

  totalPriceAfterTax = totalPrice + (totalPrice * Tax);

  print(
      '\n' "Total Price Before Tax Added: ${totalPrice.toStringAsFixed(2)}\$");
  print(
      "Total Price After Tax Added: ${totalPriceAfterTax.toStringAsFixed(2)}\$"
      '\n');
}
