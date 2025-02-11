class User {
  final String firstName;
  final String lastName;
  final int? age;
  final String? phoneNumber;

  User({
    required this.firstName,
    required this.lastName,
    this.age,
    this.phoneNumber,
  });
}

class UserBuilder {
  String firstName;
  String lastName;
  int? age;
  String? phoneNumber;

  UserBuilder(this.firstName, this.lastName);

  UserBuilder setAge(int age_) {
    age = age_;
    return this;
  }

  UserBuilder setPhone(String phoneNumber_) {
    phoneNumber = phoneNumber_;
    return this;
  }

  User build() {
    return User(
      firstName: firstName,
      lastName: lastName,
      age: age,
      phoneNumber: phoneNumber,
    );
  }
}
