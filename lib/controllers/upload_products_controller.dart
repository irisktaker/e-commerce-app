import 'dart:io';
import 'package:ecommerce_app/utils/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class UploadProductsController {
  Uuid uuid = const Uuid();
  _addImageToStorage(File? image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('products')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image!);
    TaskSnapshot taskSnapshot = await uploadTask;

    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> uploadProducts(
      String id,
      String title,
      String description,
      String productCategoryName,
      var price,
      var quantity,
      File? imageUrl) async {
    String res = 'something happened';
    try {
      final productId = uuid.v4();

      if (title.isNotEmpty &&
          description.isNotEmpty &&
          price.isNotEmpty &&
          quantity.isNotEmpty &&
          productCategoryName.isNotEmpty &&
          imageUrl != null) {
        String downloadUrl = await _addImageToStorage(imageUrl);

        await firebaseFirestore.collection('products').doc(productId).set({
          'id': id,
          'title': title,
          'price': price,
          'description': description,
          'imageUrl': downloadUrl,
          'productCategoryName': productCategoryName,
          'quantity': quantity,
        });
      }
    } catch (e) {
      e.toString();
    }

    return res;
  }
}
