enum ActivityType {
  restaurant,
  cafe,
  weddingHall,
  club,
}

extension ActivityTypeExtension on ActivityType {

  String get title {
    switch (this) {
      case ActivityType.restaurant:
        return "Restaurant";

      case ActivityType.cafe:
        return "Cafe";

      case ActivityType.weddingHall:
        return "Wedding Hall";

      case ActivityType.club:
        return "Club";
    }
  }

  String get apiValue {
    switch (this) {
      case ActivityType.restaurant:
        return "Restaurant";

      case ActivityType.cafe:
        return "Cafe";

      case ActivityType.weddingHall:
        return "Wedding hall";

      case ActivityType.club:
        return "Club";
    }
  }
}