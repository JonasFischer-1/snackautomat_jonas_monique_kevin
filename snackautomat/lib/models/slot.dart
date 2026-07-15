import 'package:snackautomat/models/product.dart';

class Slot {
  final String id;
  int bestand;
  final Product product;

  Slot({required this.id, required this.bestand, required this.product});
}
