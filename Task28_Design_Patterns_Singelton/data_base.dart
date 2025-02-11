class DataBase {
  static DataBase? _instance;

  DataBase._();

  static DataBase getInstance() {
    if (_instance == null) {
      _instance = DataBase._();
    }
    return _instance!;
  }
}
