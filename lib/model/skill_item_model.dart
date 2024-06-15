import 'package:portfolio/model/skill_model.dart';

class SkillItemModel {
  final int crossAxisCellCount;
  final int mainAxisCellCount;
  final SkillModel skillModel;

  SkillItemModel(
      {required this.crossAxisCellCount,
      required this.mainAxisCellCount,
      required this.skillModel});
}
