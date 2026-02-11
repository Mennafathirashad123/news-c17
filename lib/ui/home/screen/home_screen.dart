import 'package:flutter/material.dart';
import 'package:news_c17/core/resources/strings_manager.dart';
import 'package:news_c17/model/category_model.dart';
import 'package:news_c17/ui/articles/screen/articles_screen.dart';
import 'package:news_c17/ui/categories/screen/categories_screen.dart';
import 'package:news_c17/ui/home/widgets/home_drawer.dart';

class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory!=null?selectedCategory!.title:StringsManager.home),
      ),
      drawer: HomeDrawer(goToHome),
      body: selectedCategory!=null
          ?ArticlesScreen(selectedCategory!)
          :CategoriesScreen(onCategoryClick),
    );
  }

  onCategoryClick(CategoryModel newCategory){
    selectedCategory = newCategory;
    setState(() {

    });
  }

  goToHome(){
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
