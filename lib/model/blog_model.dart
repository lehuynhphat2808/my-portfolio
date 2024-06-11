class BlogModel {
  final DateTime date;
  final String image;

  final String name;
  final String detail;
  String url;
  bool isSelected;

  BlogModel(
      {required this.date,
      required this.image,
      required this.name,
      required this.detail,
      this.url = '',
      this.isSelected = false});
}
