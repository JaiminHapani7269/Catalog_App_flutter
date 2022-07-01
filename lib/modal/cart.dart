// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison
import 'package:velocity_x/velocity_x.dart';

import 'package:catalog_app/modal/catalog.dart';
import 'package:catalog_app/store/store.dart';

class CartModel {
  late CatalogModel _catalog;

  //collection of Ids
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get item in cart
  List<Item> get items => _itemIds.map((id) => _catalog.getByID(id)).toList();

  //Total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation({
    required this.item,
  });
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation({
    required this.item,
  });
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
