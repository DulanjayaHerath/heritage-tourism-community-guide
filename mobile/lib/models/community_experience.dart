class CommunityExperience {
  final int id;
  final String title;
  final String location;
  final String imagePath;
  final String hostName;
  final String description;
  final int durationHours;
  final double price;

  const CommunityExperience({
    required this.id,
    required this.title,
    required this.location,
    required this.imagePath,
    required this.hostName,
    required this.description,
    required this.durationHours,
    required this.price,
  });
}