enum AuthStates { loading, initial, error }

class AuthState {
  final AuthStates status;
  //final Failure? failure;
  final String? selectedActivityType;

  const AuthState({
    this.status = AuthStates.initial,
    //this.failure,
    this.selectedActivityType,
  });
  AuthState copyWith({
    AuthStates? status,
    //Failure? failure,
    String? selectedActivityType
  }) {
    return AuthState(
      status: status ?? this.status,
      //failure: failure ?? this.failure,
      selectedActivityType: selectedActivityType ?? this.selectedActivityType,
    );
  }
}
