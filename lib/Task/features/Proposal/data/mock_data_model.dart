import 'dart:ui';

class ProposalModel {
  final String title;
  final String date;
  final String status;
  final int itemsCount;
  final double totalCost;
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;

  ProposalModel({
    required this.title,
    required this.date,
    required this.status,
    required this.itemsCount,
    required this.totalCost,
    required this.textColor,
    required this.borderColor,
    required this.backgroundColor,
  });
}
