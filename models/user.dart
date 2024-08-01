class User {
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  User(String firstName, String lastName, String email, String password) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;
    this.password = password;
  }

  String toString() {
    return 'first name: $firstName , last name: $lastName , email: $email , password: $password';
  }

  static Map<String, dynamic> toJson(User user) {
    return {
      "firstName": user.firstName,
      "lastName": user.lastName,
      "email": user.email,
      "password": user.password,
    };
  }

  static User fromJson(Map<String, dynamic> jsonn) {
    return User(jsonn["firstName"], jsonn["lastName"], jsonn["email"],
        jsonn["password"]);
  }
}
