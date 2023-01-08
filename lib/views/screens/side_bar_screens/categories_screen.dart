import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'widgets/cetegory_widget.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '\CategoriesScreen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  dynamic _image;

  String? fileName;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    }
  }

  late String categoryName;

  _upoladCategoryBannerToStorage(dynamic image) async {
    Reference ref = _storage.ref().child('categoryImages').child(fileName!);

    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    await downloadUrl;
  }

  uploadCategory() async {
    EasyLoading.show(status: 'Upolading');
    if (_formKey.currentState!.validate()) {
      String imageUrl = await _upoladCategoryBannerToStorage(_image);

      await _firestore.collection('Categories').doc(fileName).set({
        'image': imageUrl,
        'categoryName': categoryName,
      }).whenComplete(() {
        EasyLoading.dismiss();
        setState(() {
          _image = null;
          _formKey.currentState!.reset();
        });
      });
    } else {
      print('Lose');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
            ),
            Divider(color: Colors.grey),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          border: Border.all(color: Colors.grey.shade800),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _image != null
                            ? Image.memory(
                                _image,
                                fit: BoxFit.fill,
                              )
                            : Center(
                                child: Center(child: Text('Category')),
                              ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow.shade900,
                        ),
                        onPressed: () {
                          pickImage();
                        },
                        child: Center(child: Text(' Upolad Category')),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      onChanged: (value) {
                        categoryName = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Category Name Must Not be Empty';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Category Name',
                        hintText: 'Enter Category Name',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow.shade900,
                  ),
                  onPressed: () {
                    uploadCategory();
                  },
                  child: Text('Save'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow.shade900,
                  ),
                ),
              ),
            ),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
