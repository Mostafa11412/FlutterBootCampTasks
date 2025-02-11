# **Singleton Pattern in Dart**  

## **Overview**  
This project demonstrates the **Singleton design pattern** in **Dart**, ensuring that only **one instance** of the `DataBase` class is created and shared across the application.  

## **Project Structure**  
- **`data_base.dart`** → Defines the `DataBase` class using the Singleton pattern.  
- **`main.dart`** → Tests the Singleton implementation by creating multiple instances and verifying if they refer to the same object.  

## **Implementation Details**  
The **Singleton** pattern ensures that:  
✅ Only **one instance** of `DataBase` is created.  
✅ Every call to `getInstance()` returns the same instance.  
