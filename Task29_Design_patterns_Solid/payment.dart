abstract class Payment {
  void pay(double amount);
}

class CashPayment implements Payment {
  @override
  void pay(double amount) {
    print("Paying $amount Using cash.");
  }
}

class CreditPayment implements Payment {
  @override
  void pay(double amount) {
    print("Paying $amount Using Credit.");
  }
}
