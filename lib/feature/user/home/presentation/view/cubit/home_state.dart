enum HomeStates { loading, initial, error }

class HomeState {
  final HomeStates status;
  //final Failure? failure;
  final int? currentIndex;
  final String? selectedMaterialType;
  final String? selectedActiveType;

  const HomeState({
    this.status = HomeStates.initial,
    //this.failure,
    this.currentIndex =0,
    this.selectedMaterialType,
    this.selectedActiveType,
  });
  HomeState copyWith({
    HomeStates? status,
    //Failure? failure,
    int? currentIndex,
     String? selectedMaterialType,
     String? selectedActiveType,
  }) {
    return HomeState(
      status: status ?? this.status,
      //failure: failure ?? this.failure,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedMaterialType: selectedMaterialType ?? this.selectedMaterialType,
      selectedActiveType: selectedActiveType ?? this.selectedActiveType,
    );
  }
}
