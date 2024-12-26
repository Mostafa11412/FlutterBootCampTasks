import 'book.dart';
import 'user.dart';

class Library {
  //Initalizing Books and Users as Empty Lists of its Types Using Created User And Book Classes
  List<Book> books = [];
  List<User> users = [];

  //Add Book Function Takes book of type Book then add it to Books List
  addBook(Book book) {
    books.add(book);
    print("Book added Succefully");
  }

  //Add User Function Takes User of type User then add it to Users List
  addUser(User user) {
    users.add(user);
    print("User added Succefully");
  }

  //Borrow Book Function takes Book as parameter and assign it as borrowed if its available
  borrowBook(Book book) {
    //check if book in our library
    if (books.contains(book)) {
      //check if Book is Already Borrowed
      if (book.borrowed) {
        //if Borrowed, Display message to user
        print(
            "Sorry, ${book.title} Book is currently Borrowed and its Not Available Right Now.");
      } else {
        //if Not Borrowed, change book state to borrowed.

        //using indexWhere List built-in function to find matching book and change its state.
        books[books.indexWhere((element) => element == book)].borrowed = true;
        print("${book.title} Book Borrowed Succefully.");
      }
    } else {
      //if Not Found in Library , Display message to user.
      print("Sorry, We Dont Have ${book.title} Book in Library");
    }
  }

  //Return Book Function takes Book as parameter and assign it as Not borrowed.
  returnBook(Book book) {
    //check if book in our library
    if (books.contains(book)) {
      //using indexWhere List built-in function to find matching book and change its state.
      books[books.indexWhere((element) => element == book)].borrowed = false;
      print("${book.title} Book Returned Succefully.");
    } else {
      //if Not Found in Library , Display message to user.

      print("Book Not Found");
    }
  }

  //Display Function To Print Library Current State To user.
  displayInfo() {
    //iterate on users list if its not empty and print each user details using Display info which made in user class.
    print("==============================");
    print("Library Users: ");
    users.isEmpty
        ? print("There is No users Added Yet")
        : users.forEach(
            (user) => user.displayInfo(),
          );

    //iterate on books list if its not empty and print each book details using Display info which made in book class.
    print("==============================");
    print("Library Books: ");
    books.isEmpty
        ? print("There is No Books Added Yet")
        : books.forEach(
            (book) => book.displayInfo(),
          );
    print("==============================");
  }
}
