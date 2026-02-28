import 'package:flutter/material.dart';
import 'package:news_c17/core/resources/strings_manager.dart';
import 'package:news_c17/model/category_model.dart';
import 'package:news_c17/ui/articles/screen/articles_screen.dart';
import 'package:news_c17/ui/categories/screen/categories_screen.dart';
import 'package:news_c17/ui/home/widgets/home_drawer.dart';
import 'package:news_c17/ui/search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory!=null?selectedCategory!.title:StringsManager.home),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
            }, 
            icon: const Icon(Icons.search, size: 28)
          )
        ],
      ),
      drawer: HomeDrawer(onPress: goToHome),
      body: selectedCategory!=null
          ?ArticlesScreen(category: selectedCategory!)
          :CategoriesScreen(selectCategory: onCategoryClick),
    );
  }

  void onCategoryClick(CategoryModel newCategory){
    selectedCategory = newCategory;
    setState(() {

    });
  }

  void goToHome(){
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
