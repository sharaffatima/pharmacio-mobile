import 'package:pharmacio_flutter_mobile/features/inventory/data/models/mock_data_model.dart';

final List<InventoryItemModel> mockInventoryList = [
  InventoryItemModel(
    name: "Panadol Advance 500mg",
    minStock: 20,
    currentStock: 45,
    lastUpdated: "2 hours ago",
  ),
  InventoryItemModel(
    name: "Aspirin 100mg",
    minStock: 30,
    currentStock: 12,
    lastUpdated: "5 hours ago",
  ),
  InventoryItemModel(
    name: "Amoxicillin 500mg",
    minStock: 15,
    currentStock: 0,
    lastUpdated: "1 day ago",
  ),
  InventoryItemModel(
    name: "Vitamin C 1000mg",
    minStock: 50,
    currentStock: 5,
    lastUpdated: "10 mins ago",
  ),
  InventoryItemModel(
    name: "Ibuprofen 400mg",
    minStock: 25,
    currentStock: 100,
    lastUpdated: "3 hours ago",
  ),
];
