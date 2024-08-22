class SignInState {
  final String email;
  final String password;

//constructor
  SignInState({
    this.email = "",
    this.password = "",
  });

//copywith constuctor which takes last initialised variable values, it returns an object
  SignInState copyWith({
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
