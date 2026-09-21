import '../../models/community_experience.dart';

const List<CommunityExperience> communityExperiences = [
  CommunityExperience(
    id: 1,
    title: 'Traditional Pottery',
    location: 'Kandy District',
    imagePath: 'assets/images/pottery.jpeg',
    hostName: 'Local Artisan',
    description:
        'Discover traditional Sri Lankan pottery techniques '
        'through a hands-on experience with a local artisan. '
        'Learn how clay is prepared, shaped, and transformed '
        'into beautiful handmade pottery.',
    durationHours: 2,
    price: 3500,
  ),

  CommunityExperience(
    id: 2,
    title: 'Village Cooking',
    location: 'Matale District',
    imagePath: 'assets/images/village_cooking.jpeg',
    hostName: 'Local Community Host',
    description:
        'Experience Sri Lankan village cooking and learn '
        'how traditional meals are prepared using local '
        'ingredients and time-honoured cooking techniques.',
    durationHours: 3,
    price: 4500,
  ),

  CommunityExperience(
    id: 3,
    title: 'Traditional Handloom Weaving',
    location: 'Kurunegala District',
    imagePath: 'assets/images/handloom.jpeg',
    hostName: 'Local Weaver',
    description:
        'Explore the traditional art of handloom weaving '
        'and discover how skilled artisans create beautiful '
        'textiles using traditional weaving techniques.',
    durationHours: 2,
    price: 3000,
  ),
];