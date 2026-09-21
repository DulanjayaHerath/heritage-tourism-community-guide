import 'community_experience.dart';

class ExperienceBooking {
  final int id;
  final CommunityExperience experience;
  final DateTime bookingDate;
  final int participants;
  final double totalPrice;

  const ExperienceBooking({
    required this.id,
    required this.experience,
    required this.bookingDate,
    required this.participants,
    required this.totalPrice,
  });
}