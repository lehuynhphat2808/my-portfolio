class ProjectModel {
  final String image;
  final String name;
  final String detail;
  final String tech;
  String github;
  String detailUrl;
  bool isSelected;

  ProjectModel(
      {required this.image,
      required this.name,
      required this.detail,
      required this.tech,
      this.isSelected = false,
      this.github = '',
      this.detailUrl = ''});
}
