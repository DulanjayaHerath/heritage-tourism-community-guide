import 'package:flutter/foundation.dart';

import '../../models/experience_booking.dart';

class BookingRepository extends ChangeNotifier {
  final List<ExperienceBooking> _bookings = [];

  List<ExperienceBooking> get bookings {
    return List.unmodifiable(_bookings);
  }

  void addBooking(ExperienceBooking booking) {
    _bookings.add(booking);

    notifyListeners();
  }

  void cancelBooking(int bookingId) {
    _bookings.removeWhere(
      (booking) => booking.id == bookingId,
    );

    notifyListeners();
  }
}

final bookingRepository = BookingRepository();