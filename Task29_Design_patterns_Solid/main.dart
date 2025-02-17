import 'payment.dart';

void main() {
  Payment cash = CashPayment();
  Payment credit = CreditPayment();

  cash.pay(100);
  credit.pay(100);
}
