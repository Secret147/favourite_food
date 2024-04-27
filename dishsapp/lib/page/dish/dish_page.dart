import 'package:dishsapp/model/dish.dart';
import 'package:dishsapp/providers/dish_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DishPage extends StatefulWidget {
  const DishPage({super.key});

  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
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
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Image.network(
              img,
              fit: BoxFit.cover,
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
              TextField(
                controller: imageController,
                decoration: InputDecoration(
                  hintText: "Image",
                  enabledBorder: outlineCustom(),
                  focusedBorder: outlineCustom(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: "Description",
                  enabledBorder: outlineCustom(),
                  focusedBorder: outlineCustom(),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    context.read<DishProvider>().postDish(addDish(
                        titleController.text,
                        descriptionController.text,
                        imageController.text));
                  });
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
