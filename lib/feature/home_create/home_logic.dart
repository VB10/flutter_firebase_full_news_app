import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_news_app/product/models/category.dart';
import 'package:flutter_firebase_full_news_app/product/models/index.dart';
import 'package:flutter_firebase_full_news_app/product/utility/exception/custom_exception.dart';
import 'package:flutter_firebase_full_news_app/product/utility/firebase/firebase_collections.dart';
import 'package:flutter_firebase_full_news_app/product/utility/firebase/firebase_utility.dart';
import 'package:flutter_firebase_full_news_app/product/utility/image/pick_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';

class HomeLogic with FirebaseUtility {
  final TextEditingController titleController = TextEditingController();
  CategoryModel? _categoryModel;
  List<CategoryModel> _categories = [];
  Uint8List? _selectedFileBytes;
  XFile? _selectedFile;

  bool isValidateAllForm = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  List<CategoryModel> get categories => _categories;
  Uint8List? get selectedFileBytes => _selectedFileBytes;

  void updateCategory(CategoryModel categoryModel) {
    _categoryModel = categoryModel;
  }

  bool checkValidateAndSave(ValueSetter<bool>? onUpdate) {
    final value = formKey.currentState?.validate() ?? false;

    if (value != isValidateAllForm && selectedFileBytes != null) {
      isValidateAllForm = value;
      onUpdate?.call(value);
    }

    return isValidateAllForm;
  }

  Future<void> pickAndCheck(ValueSetter<bool> onUpdate) async {
    _selectedFile = await PickImage().pickImageFromGallery();
    _selectedFileBytes = await _selectedFile?.readAsBytes();
    checkValidateAndSave(
      (value) {},
    );
    onUpdate.call(true);
  }

  void dispose() {
    titleController.dispose();
    _categoryModel = null;
  }

  Future<void> fetchAllCategory() async {
    final response = await fetchList<CategoryModel, CategoryModel>(
      CategoryModel(),
      FirebaseCollections.category,
    );

    _categories = response ?? [];
  }

  Future<bool> save() async {
    if (!checkValidateAndSave(null)) return false;
    final imageReference = createImageReference();
    if (imageReference == null) throw ItemCreateException('image not empty');
    if (_selectedFileBytes == null) return false;
    await imageReference.putData(_selectedFileBytes!);
    final urlPath = await imageReference.getDownloadURL();
    final response = await FirebaseCollections.news.reference.add(
      News(
        backgroundImage: urlPath,
        category: _categoryModel?.name,
        categoryId: _categoryModel?.id,
        title: titleController.text,
      ).toJson(),
    );

    if (response.id.isNullOrEmpty) return false;
    return true;
  }

  Reference? createImageReference() {
    if (_selectedFile == null || (_selectedFile?.name.isNullOrEmpty ?? true)) {
      return null;
    }
    final storageRef = FirebaseStorage.instance.ref();

    final imageRef = storageRef.child(_selectedFile!.name);
    return imageRef;
  }
}
