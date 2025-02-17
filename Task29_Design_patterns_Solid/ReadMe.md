# Simple Payment System

This is a simple payment system implemented in Dart using **SOLID principles**. It supports two payment methods:
- **Cash Payment**
- **Credit Payment**

## Features
✅ Follows **SOLID Principles**  
✅ Easy to **extend** with new payment methods  
✅ Simple **and** modular design  

## SOLID Principles Applied
- **S**ingle Responsibility: Each class has one responsibility.
- **O**pen/Closed: New payment methods can be added without modifying existing code.
- **L**iskov Substitution: Different payment methods can be used interchangeably.
- **I**nterface Segregation: Each class only implements necessary methods.
- **D**ependency Inversion: The system depends on abstractions, not concrete implementations.

## File Structure
```
/payment-system
│── main.dart         # Entry point
│── payment.dart      # Payment class and implementations
│── README.md         # Project documentation
```


 Expected output:  
   ```
   Paying 100 Using cash.
   Paying 100 Using Credit.
   ```

