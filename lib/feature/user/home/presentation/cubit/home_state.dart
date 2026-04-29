enum HomeStates { loading, initial, error }

class HomeState {
  final HomeStates status;
  //final Failure? failure;
  final int? currentIndex;
  final String? selectedMaterialType;
  final String? selectedActiveType;
  final Map<String, int> counters;

  const HomeState({
    this.status = HomeStates.initial,
    //this.failure,
    this.currentIndex =0,
    this.selectedMaterialType,
    this.selectedActiveType,
    this.counters = const {
      '2kg': 0,
      '5kg': 0,
      '10kg': 0,
    },
  });

  HomeState copyWith({
    HomeStates? status,
    //Failure? failure,
    int? currentIndex,
     String? selectedMaterialType,
     String? selectedActiveType,
    Map<String, int>? counters,
  }) {
    return HomeState(
      status: status ?? this.status,
      //failure: failure ?? this.failure,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedMaterialType: selectedMaterialType ?? this.selectedMaterialType,
      selectedActiveType: selectedActiveType ?? this.selectedActiveType,
      counters: counters ?? this.counters,
    );
  }
}
