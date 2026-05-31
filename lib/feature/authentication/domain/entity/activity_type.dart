import 'package:easy_localization/easy_localization.dart';
import '../../../../core/utils/app_strings.dart';

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
        return AppStrings.restaurant.tr();

      case ActivityType.cafe:
        return AppStrings.cafe.tr();

      case ActivityType.weddingHall:
        return AppStrings.weddingHall.tr();

      case ActivityType.club:
        return AppStrings.club.tr();
    }
  }

  // Value sent to API
  String get apiValue {
    switch (this) {
      case ActivityType.restaurant:
        return 'Restaurant';

      case ActivityType.cafe:
        return 'Cafe';

      case ActivityType.weddingHall:
        return 'Wedding hall';

      case ActivityType.club:
        return 'Club';
    }
  }
}