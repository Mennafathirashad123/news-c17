import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/ui/articles/widget/article_item.dart';
import 'package:news_c17/core/resources/colors_manager.dart';

class NewsSearchDelegate extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsManager.lightPrimaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white60),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, '');
          } else {
            query = '';
            showSuggestions(context);
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isEmpty) {
      return const Center(child: Text("Type something to search..."));
    }
    return FutureBuilder(
      future: ApiManager.searchArticles(query),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (asyncSnapshot.hasError) {
          return Center(child: Text(asyncSnapshot.error.toString()));
        }
        var response = asyncSnapshot.data;
        var articles = response?.articles ?? [];

        if (articles.isEmpty) {
          return const Center(child: Text("No articles found"));
        }

        return Padding(
          padding: REdgeInsets.all(16),
          child: ListView.separated(
              itemBuilder: (context, index) => ArticleItem(
                    article: articles[index],
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 16.h,
                  ),
              itemCount: articles.length),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text("Search for specific articles"));
    }
    return buildResults(context);
  }
}
