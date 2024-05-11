import 'dart:io';

import 'package:dishsapp/model/dish.dart';
import 'package:dishsapp/providers/provider.dart';
import 'package:dishsapp/utils/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DishPage extends StatefulWidget {
  const DishPage({super.key});

  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  File? _image;

  // This is the image picker
  final _picker = ImagePicker();

  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();
  dynamic addDish(String title, String description, String image) {
    if (title != "" && description != "" && image != "") {
      Map<String, dynamic> newDish = {
        "title": title,
        "description": description,
        "image": image,
        "liked": 0,
      };
      return newDish;
    }
  }

  String imageUrl = '';

  @override
  void dispose() {
    titleController.dispose();
    imageController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String img =
        "https://www.tasteofhome.com/wp-content/uploads/2018/01/Easy-Chana-Masala_EXPS_SDON17_175124_B06_30_3b-3.jpg?fit=700,700";
    return Scaffold(
      body: Column(children: [
        GestureDetector(
          onTap: () {
            _openImagePicker();
          },
          child: Expanded(
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: _image == null
                  ? Image.network(img, fit: BoxFit.cover)
                  : Image.file(_image!, fit: BoxFit.cover),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 40),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Title",
                  enabledBorder: outlineCustom(),
                  focusedBorder: outlineCustom(),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              SizedBox(
                height: 140,
                child: TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  style: const TextStyle(
                    decorationThickness: 0,
                    color: AppColors.textColor,
                    fontSize: 20,
                  ),
                  textAlignVertical: const TextAlignVertical(y: -1),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    enabledBorder: outlineCustom(),
                    focusedBorder: outlineCustom(),
                    hintText: 'Write a description',
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  if (_image != null) {
                    String fileName =
                        DateTime.now().microsecondsSinceEpoch.toString();
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDireImages =
                        referenceRoot.child("images");
                    Reference referenceImageToUpload =
                        referenceDireImages.child(fileName);
                    try {
                      // await FirebaseStorage.instance
                      //     .refFromURL(widget.user.image)
                      //     .delete();
                      await referenceImageToUpload.putFile(
                          _image!, SettableMetadata(contentType: 'image/jpeg'));
                      imageUrl = await referenceImageToUpload.getDownloadURL();
                    } catch (error) {
                      return;
                    }
                  }

                  await context.read<DishProvider>().postDish(addDish(
                      titleController.text,
                      descriptionController.text,
                      imageUrl));

                  context.goNamed("home");
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Update Dish',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
              )
            ]),
          ),
        ),
      ]),
    );
  }

  OutlineInputBorder outlineCustom() => OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(10));
}
