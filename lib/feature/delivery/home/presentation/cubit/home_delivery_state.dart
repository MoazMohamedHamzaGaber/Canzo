enum HomeDeliveryStates { loading, initial, error }

class HomeDeliveryState {
  final HomeDeliveryStates status;
  //final Failure? failure;
  final String? selectedActiveType;

  const HomeDeliveryState({
    this.status = HomeDeliveryStates.initial,
    //this.failure,
    this.selectedActiveType,
  });

  HomeDeliveryState copyWith({
    HomeDeliveryStates? status,
    //Failure? failure,
     String? selectedActiveType,
  }) {
    return HomeDeliveryState(
      status: status ?? this.status,
      //failure: failure ?? this.failure,
      selectedActiveType: selectedActiveType ?? this.selectedActiveType,
    );
  }
}
