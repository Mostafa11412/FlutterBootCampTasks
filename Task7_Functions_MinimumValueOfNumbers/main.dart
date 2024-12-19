void main() {
  List<double> numbers = [5, 1, -55, 123.5, -14.7, 1233, -4, 9];

  double result = findMin(numbers: numbers);
  print('\n' "Minimum Number of List is ${result.toStringAsFixed(2)}");
}

double findMin({required List<double> numbers}) {
  double min = double.infinity;
  numbers.forEach(
    (number) {
      if (number < min) min = number;
    },
  );

  return min;
}
