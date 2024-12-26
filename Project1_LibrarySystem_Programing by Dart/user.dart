class User {
  int _id;
  String _name;

  User(
    this._id,
    this._name,
  );

  displayInfo() {
    print(
        "User ID: ${_id} | User Title: ${_name}");
  }
}
