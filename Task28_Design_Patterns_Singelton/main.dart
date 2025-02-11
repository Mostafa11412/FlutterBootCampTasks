import 'data_base.dart';

void main() {
  //note i didnt make test in client class because it needs to be run in main to test it.
  DataBase db1 = DataBase.getInstance();

  DataBase db2 = DataBase.getInstance();

  if (db1 == db2) {
    print("Equal");
  } else {
    print("Not Equal");
  }
}
