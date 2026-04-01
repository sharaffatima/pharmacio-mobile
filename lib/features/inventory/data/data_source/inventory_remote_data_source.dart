import 'package:pharmacio_flutter_mobile/core/networking/api_services_impl.dart';
import '../models/inventory_response.dart';

abstract class InventoryRemoteDataSource {
  Future<InventoryResponse> getInventory();
}

class InventoryRemoteDataSourceImpl implements InventoryRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  InventoryRemoteDataSourceImpl({required this.apiServicesImpl});

  @override
  Future<InventoryResponse> getInventory() async {
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzc1MTI1MzE5LCJpYXQiOjE3NzUwMzg5MTksImp0aSI6Ijc5MjYyYWNlYmRlZjQ2ZWRiN2RjOTBhNjJkYTZjYzFlIiwidXNlcl9pZCI6IjEifQ.jTuZa9lFWAQs0HWeSaJblpOZshEvwS6YCn5hSp8K-sA';
    final response = await apiServicesImpl.get('inventory/', token: token);
    return InventoryResponse.fromJson(response);
  }
}
