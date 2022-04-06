import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:tugas_minggu_5/controllers/home_controller.dart';
import 'package:tugas_minggu_5/controllers/new_article_controller.dart';
import 'package:tugas_minggu_5/globals/style.dart';
import 'package:tugas_minggu_5/views/widgets/input_fields.dart';

class AddArticle extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // HomeController homeController = Get.find<HomeController>();
    NewArticleController newArticleController =
        Get.find<NewArticleController>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          color: Colors.pink,
          child: Center(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Center(
                  child: Text(
                    'Add New News',
                    style: kHeadingTextWhite,
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 20.0),
                  width: double.infinity,
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        RegularInputWidget(
                          controller: newArticleController.titleController,
                          valid: "Title must be filled",
                          label: "Title",
                          decorate: kInputDecoration.copyWith(
                            fillColor: Colors.pinkAccent,
                            hintText: "Enter news title",
                          ),
                        ),
                        RegularInputWidget(
                          controller:
                              newArticleController.descriptionController,
                          valid: "Description must be filled",
                          label: "Description",
                          decorate: kInputDecoration.copyWith(
                            fillColor: Colors.pinkAccent,
                            hintText: "Describe the article",
                          ),
                        ),
                        RegularInputWidget(
                          controller: newArticleController.imageUrlController,
                          valid: "Image URL must be filled",
                          label: "Title Image URL",
                          decorate: kInputDecoration.copyWith(
                            fillColor: Colors.pinkAccent,
                            hintText: "https://images.unsplash.com/....",
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Content',
                              style: kTitleTextWhite,
                            ),
                            SizedBox(height: 5.0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(7.0),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                controller:
                                    newArticleController.contentController,
                                maxLines: 7,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Article input must be filled";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: kInputDecoration.copyWith(
                                  fillColor: Colors.pinkAccent,
                                  hintText: 'Enter News Article',
                                ),
                              ),
                            ),
                            SizedBox(height: 30.0),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        InkWell(
                          onTap: () {
                            if (_globalKey.currentState!.validate()) {
                              newArticleController.postDataToApi();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Center(
                              child: Text(
                                'Post this news',
                                style: kTitleTextWhite.copyWith(
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
