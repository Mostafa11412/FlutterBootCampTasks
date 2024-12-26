class Book {
  int _id;
  String title;
  bool borrowed;

  Book(
    this._id,
    this.title,
  ) : borrowed = false;

  displayInfo() {
    print(
        "Book ID: ${_id} | Book Title: ${title} | Is Borrowed: ${borrowed ? 'Yes' : 'No'}");
  }
}
