import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/item_controller.dart';
import '../../controllers/auth_controller.dart';
import '../../models/item.dart';
import '../../repositories/item_repository.dart';

class ItemListScreen extends StatelessWidget {
  final ItemController itemController = Get.put(ItemController(repository: ItemRepository()));
  final AuthController authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  final _itemNameController = TextEditingController();

  ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud Operation...'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white, size: 30),
            onPressed: () {
              authController.logout();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (itemController.items.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ListView.builder(
                  itemCount: itemController.items.length,
                  itemBuilder: (context, index) {
                    final item = itemController.items[index];
                    return Card(
                      margin: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth < 600 ? 10 : constraints.maxWidth * 0.2,
                        vertical: 8,
                      ),
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(item.name),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  _showDialog(context, item: item);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  itemController.deleteItem(item.id);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDialog(BuildContext context, {Item? item}) {
    if (item != null) {
      _itemNameController.text = item.name;
    } else {
      _itemNameController.clear();
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item == null ? 'Add new item' : 'Update item'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _itemNameController,
                  decoration: const InputDecoration(
                    labelText: 'Item Name',
                  ),
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _submitForm(context, item),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an item name';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Submit'),
              onPressed: () => _submitForm(context, item),
            ),
          ],
        );
      },
    );
  }

  void _submitForm(BuildContext context, Item? item) async {
    if (_formKey.currentState!.validate()) {
      if (item == null) {
        final success = await itemController.addItem(_itemNameController.text);
        Navigator.of(context).pop();
        if (success) {
          _showSnackBar(context, 'Success', 'New item added successfully...');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to add item')),
          );
        }
      } else {
        final success = await itemController.updateItem(item.id, _itemNameController.text);
        Navigator.of(context).pop();
        if (success) {
          _showSnackBar(context, 'Success', 'Item updated successfully...');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to update item')),
          );
        }
      }
    }
  }

  void _showSnackBar(BuildContext context, String title, String message) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(CupertinoIcons.check_mark_circled_solid, color: Colors.white),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      padding: const EdgeInsets.all(10),
      borderRadius: 10,
      isDismissible: true,
      duration: const Duration(seconds: 3),
    );
  }
}

