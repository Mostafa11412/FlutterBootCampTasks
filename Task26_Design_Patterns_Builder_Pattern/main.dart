import 'user_model.dart';

void main() {
  User user = UserBuilder("Mostafa", "Saad")
      .setAge(30)
      .setPhone("011410000000")
      .build();

  print(
      "User: ${user.firstName} ${user.lastName}, Age: ${user.age}, Phone: ${user.phoneNumber}");
}
