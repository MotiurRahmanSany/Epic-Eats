import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final orders = FirebaseFirestore.instance.collection('Orders');
  final cartItems = FirebaseFirestore.instance.collection('Cart-Items');
  final favorites = FirebaseFirestore.instance.collection('Favorites');
  final orderHistory = FirebaseFirestore.instance.collection('Order-History');

  Future<void> saveCartItemsInCloud(String order) async {
    await orders.add({
      'date': DateTime.now(),
      'order': order,
    });
  }
}
