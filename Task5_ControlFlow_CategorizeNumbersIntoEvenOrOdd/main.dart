void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 10, 20, 122, 495];

  for (int number in numbers) {
    switch (number % 2 == 0) {
      case true:
        print("This number $number is Even.");
        break;
      case false:
        print("This number $number is Odd.");
        break;
    }
  }
}
