enum HomeStates { loading, initial, error }

class HomeState {
  final HomeStates status;
  //final Failure? failure;
  final int? currentIndex;

  const HomeState({
    this.status = HomeStates.initial,
    //this.failure,
    this.currentIndex =0,
  });
  HomeState copyWith({
    HomeStates? status,
    //Failure? failure,
    int? currentIndex
  }) {
    return HomeState(
      status: status ?? this.status,
      //failure: failure ?? this.failure,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
