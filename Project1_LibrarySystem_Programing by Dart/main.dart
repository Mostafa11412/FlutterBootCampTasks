import 'book.dart';
import 'library.dart';
import 'user.dart';

void main() {
  //initializing Users Using User Class
  User user1 = User(001, "Mostafa");
  User user2 = User(222, "Mohamed");

  //Creating Books Using Book Class
  Book book1 = Book(232, "Hobbies");
  Book book2 = Book(241, "Football");
  Book book3 = Book(789, "Fishing");

  //Creating The library Using Library Class
  Library library = Library();

  //Displaying Library Info Before performing operations
  library.displayInfo();

//Add Books And Users To Library To test Library Logic
  library.addBook(book1);
  library.addBook(book2);

  library.addUser(user1);
  library.addUser(user2);

  //Displaying Library Info After Adding Users and Books
  library.displayInfo();

  //Testing Borrow Book Logic
  library.borrowBook(book1);
  library.borrowBook(book2);
  //Testing Borrow Already Borrowed Book
  library.borrowBook(book1);
  //Testing Return Book Logic
  library.returnBook(book1);
  //Testing Borrow Book1 after Return it
  library.borrowBook(book1);

  //Testing Borrow Book Not Added in Library
  library.borrowBook(book3);
  //Testing Return Book Not Added in Library
  library.returnBook(book3);

  //Displaying Library Info Final State
  library.displayInfo();
}
