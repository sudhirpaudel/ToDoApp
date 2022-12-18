class UserLogin {
  final String email;
  final String password;

  const UserLogin({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

class UserSignup {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;

  const UserSignup({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'firstName':firstName,
        'lastNmae':lastName,
        'phoneNumber':phoneNumber,
        'email': email,
        'password': password,
      };
}
