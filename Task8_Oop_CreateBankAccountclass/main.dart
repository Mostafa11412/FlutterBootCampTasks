import 'bankAccountClass.dart';

void main() {
//First Scenario
  print("================================================");
  print("First Scenario");
  BankAccount account1 = BankAccount("Acc01", 5000);
  account1.displayAccountInfo();
  account1.withdraw(1200);
  account1.deposit(1000);
  account1.displayAccountInfo();

//Second Scenario

  BankAccount account2 = BankAccount.BalanceConstructor("Acc02");
  print("===============================================");
  print("Second Scenario");
  account2.displayAccountInfo();
  account2.withdraw(1200);
  account2.deposit(2000);
  account2.withdraw(1200);
  account2.displayAccountInfo();

//Third Scenario
  print("==================================================");
  print("Third Scenario");
  BankAccount account3 = BankAccount("ACC03", 5000);
  account3.displayAccountInfo();
  account3.withdraw(-1200);
  account3.withdraw(1200);
  account3.deposit(-1000);
  account3.deposit(1000);

  account3.displayAccountInfo();
}
