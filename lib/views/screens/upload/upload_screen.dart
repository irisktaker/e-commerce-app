import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:ecommerce_app/views/widgets/gradient_icon.dart';
import 'package:ecommerce_app/views/screens/upload/upload_bloc.dart';

class UploadScreen extends StatefulWidget {
  static const routeName = '/UploadProductForm';
  const UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final _bloc = UploadBloc();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Card(
                  margin: const EdgeInsets.all(15),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 9),
                                child: TextField(
                                  controller: _bloc.titleController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    labelText: 'Product Title',
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: TextField(
                                controller: _bloc.priceController,
                                key: const ValueKey('Price \$'),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                decoration: const InputDecoration(
                                  labelText: 'Price \$',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        /* Image picker here ***********************************/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              //  flex: 2,
                              child: _bloc.pickedImage == null
                                  ? Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius: BorderRadius.circular(4),
                                        color:
                                            Theme.of(context).backgroundColor,
                                      ),
                                    )
                                  : Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 200,
                                      width: 200,
                                      child: Container(
                                        height: 200,
                                        // width: 200,
                                        decoration: BoxDecoration(
                                          // borderRadius: BorderRadius.only(
                                          //   topLeft: const Radius.circular(40.0),
                                          // ),
                                          color:
                                              Theme.of(context).backgroundColor,
                                        ),
                                        child: Image.file(
                                          _bloc.pickedImage!,
                                          fit: BoxFit.fill,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: TextButton.icon(
                                    onPressed: () =>
                                        _bloc.pickImageCamera(setState),
                                    icon: const Icon(Icons.camera,
                                        color: Colors.purpleAccent),
                                    label: const Text(
                                      'Camera',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  child: TextButton.icon(
                                    onPressed: () =>
                                        _bloc.pickImageGallery(setState),
                                    icon: const Icon(Icons.image,
                                        color: Colors.purpleAccent),
                                    label: const Text(
                                      'Gallery',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  child: TextButton.icon(
                                    onPressed: () => _bloc.removeImage,
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red,
                                    ),
                                    label: const Text(
                                      'Remove',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 9),
                                child: TextField(
                                  controller: _bloc.categoryController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    labelText: 'Add a new Category',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        TextField(
                            key: const ValueKey('Description'),
                            controller: _bloc.descriptionController,
                            maxLines: 10,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: const InputDecoration(
                              //  counterText: charLength.toString(),
                              labelText: 'Description',
                              hintText: 'Product description',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (text) {
                              // setState(() => charLength -= text.length);
                            }),
                        //    SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 9),
                                child: TextField(
                                  controller: _bloc.quantityController,
                                  keyboardType: TextInputType.number,
                                  key: const ValueKey('Quantity'),
                                  decoration: const InputDecoration(
                                    labelText: 'Quantity',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
        bottomSheet: bottomSheet(context),
      ),
    );
  }

  Container bottomSheet(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight * 0.8,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Material(
        color: Theme.of(context).backgroundColor,
        child: InkWell(
          onTap: () {
            // TODO:
            _bloc.uploadProduct();
            _bloc.titleController.clear();
            _bloc.descriptionController.clear();
            _bloc.categoryController.clear();
            _bloc.priceController.clear();
            _bloc.quantityController.clear();
          },
          splashColor: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 2),
                child: Text('Upload',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
              ),
              GradientIcon(
                CupertinoIcons.upload_circle,
                20,
                LinearGradient(
                  colors: <Color>[
                    Colors.green,
                    Colors.yellow,
                    Colors.deepOrange,
                    Colors.orange,
                    Colors.yellow
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
