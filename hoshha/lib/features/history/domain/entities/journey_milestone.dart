class JourneyMilestone {
  const JourneyMilestone({
    required this.id,
    required this.dateEn,
    required this.dateAr,
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.iconType, // 'star', 'laptop', 'teal_card', 'clock'
    this.imageUrl,
  });

  final String id;
  final String dateEn;
  final String dateAr;
  final String titleEn;
  final String titleAr;
  final String descriptionEn;
  final String descriptionAr;
  final String iconType;
  final String? imageUrl;
}
