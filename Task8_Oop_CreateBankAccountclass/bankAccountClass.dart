class BankAccount {
  int _accountId;
  double _balance;

  BankAccount(this._accountId, this._balance);

  BankAccount.BalanceConstructor(this._accountId) : _balance = 0;

  withdraw(double amount) {
    if (amount <= 0) {
      print("Please Enter a postive amount of money");
      print("================================================");
    } else if (amount > _balance) {
      print("sorry, Available Balance is not enough :(");

      print("================================================");
    } else {
      _balance -= amount;
      print("Succesful WithDraw, Your new Balance is $_balance \$");
      print("================================================");
    }
  }

  deposit(double amount) {
    if (amount <= 0) {
      print("Please Enter a postive amount of money");
      print("================================================");
    } else {
      _balance += amount;
      print("$amount \$ Added Succesfully, Your new Balance is $_balance \$");
      print("================================================");
    }
  }

  displayAccountInfo() {
    print("Your Account ID is $_accountId");
    print("Your Balance is $_balance \$");
    print("================================================");
  }
}
