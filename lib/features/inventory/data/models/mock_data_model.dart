class InventoryItemModel {
  final String name;
  final int minStock;
  final int currentStock;
  final String lastUpdated;

  InventoryItemModel({
    required this.name,
    required this.minStock,
    required this.currentStock,
    required this.lastUpdated,
  });
}
