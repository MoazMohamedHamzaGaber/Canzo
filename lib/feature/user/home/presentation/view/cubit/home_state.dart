enum HomeStates { loading, initial, error }

class HomeState {
  final HomeStates status;
  //final Failure? failure;
  final int? currentIndex;
  final String? selectedMaterialType;

  const HomeState({
    this.status = HomeStates.initial,
    //this.failure,
    this.currentIndex =0,
    this.selectedMaterialType,
  });
  HomeState copyWith({
    HomeStates? status,
    //Failure? failure,
    int? currentIndex,
     String? selectedMaterialType,
  }) {
    return HomeState(
      status: status ?? this.status,
      //failure: failure ?? this.failure,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedMaterialType: selectedMaterialType ?? this.selectedMaterialType,
    );
  }
}
