class SkillModel {
  final String image;
  final String name;
  final String level;
  bool selected;

  SkillModel(
      {required this.image,
      required this.name,
      required this.level,
      this.selected = false});
}
