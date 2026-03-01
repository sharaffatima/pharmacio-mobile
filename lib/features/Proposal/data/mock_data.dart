import 'dart:ui';

import 'package:pharmacio_flutter_mobile/features/Proposal/data/mock_data_model.dart';

final List<ProposalModel> proposals = [
  ProposalModel(
    title: "Monthly Restock - February 2026",
    date: "Feb 3, 2026",
    status: "Pending",
    itemsCount: 24,
    totalCost: 8540.00,
    textColor: const Color(0xffA54200),
    borderColor: const Color(0xffFFC95E),
    backgroundColor: const Color(0xffFFE6D2),
  ),
  ProposalModel(
    title: "Low Stock Emergency Order",
    date: "Feb 1, 2026",
    status: "Approved",
    itemsCount: 8,
    totalCost: 2150.00,
    textColor: const Color(0xff198800),
    borderColor: const Color(0xffC0FFD7),
    backgroundColor: const Color(0xffD2FFEE),
  ),
  ProposalModel(
    title: "Seasonal Stock Update",
    date: "Jan, 2026",
    status: "Rejected",
    itemsCount: 15,
    totalCost: 4200.00,
    textColor: const Color(0xff920000), // اللون الجديد للـ Rejected
    borderColor: const Color(0xffFFDBDB),
    backgroundColor: const Color(0xffFFE1E1),
  ),
];
