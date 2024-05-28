import 'package:get/get.dart';
import '../models/item.dart';
import '../repositories/item_repository.dart';

class ItemController extends GetxController {
  var items = <Item>[].obs;
  final ItemRepository repository;

  ItemController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  Future<void> fetchItems() async {
    try {
      final data = await repository.fetchItems();
      items.value = data;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<bool> addItem(String name) async {
    try {
      final success = await repository.addItem(name);
      if (success) {
        await fetchItems();
      }
      return success;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return false;
    }
  }

  Future<bool> updateItem(int id, String name) async {
    try {
      final success = await repository.updateItem(id, name);
      if (success) {
        fetchItems();
      }
      return success;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return false;
    }
  }

  Future<void> deleteItem(int id) async {
    try {
      await repository.deleteItem(id);
      fetchItems();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
