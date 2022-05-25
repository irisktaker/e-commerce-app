import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce_app/controllers/upload_products_controller.dart';

class UploadBloc {
  var uuid = const Uuid();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();

  File? _pickedImage;
  File? get pickedImage => _pickedImage;

  // get pickImageCamera => _pickImageCamera(pickedImage);
  // get pickImageGallery => _pickImageGallery(pickedImage);
  // get removeImage => _removeImage;
  get uploadProduct => _uploadProduct;

  void pickImageCamera(setState) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 40,
    );
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }

  void pickImageGallery(setState) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    final pickedImageFile = pickedImage == null ? null : File(pickedImage.path);

    setState(() {
      _pickedImage = pickedImageFile;
    });
  }

  void removeImage(setState) {
    setState(() {
      _pickedImage = null;
    });
  }

  _uploadProduct() async {
    String res = await UploadProductsController().uploadProducts(
      uuid.v4(),
      titleController.text,
      descriptionController.text,
      categoryController.text,
      priceController.text,
      quantityController.text,
      pickedImage,
    );

    return res;
  }
}
