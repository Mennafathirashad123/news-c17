import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/ui/articles/widget/article_item.dart';
import 'package:news_c17/core/resources/colors_manager.dart';
import 'package:provider/provider.dart';
import 'package:news_c17/providers/settings_provider.dart';
import '../../../model/articles_response/articles_response.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  Future<ArticlesResponse?>? _searchFuture;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    bool isDark = settingsProvider.isDark();

    return Scaffold(
      backgroundColor: isDark ? const Color(0xff121212) : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: isDark ? Colors.white54 : Colors.black54),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search, color: isDark ? Colors.white : Colors.black),
                    onPressed: () {
                      Navigator.pop(context); // Go back if tapped
                    },
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close, color: isDark ? Colors.white : Colors.black),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _query = '';
                        _searchFuture = null;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: isDark ? const Color(0xff1E1E1E) : Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: isDark ? Colors.white38 : ColorsManager.lightPrimaryColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: isDark ? Colors.white : ColorsManager.lightPrimaryColor,
                      width: 1,
                    ),
                  ),
                ),
                onChanged: (value) {
                  // Do not trigger search on every keystroke to avoid spam
                  _query = value;
                },
                onSubmitted: (value) {
                  setState(() {
                    _query = value;
                    _searchFuture = ApiManager.searchArticles(_query);
                  });
                },
              ),
            ),
            Expanded(
              child: _query.trim().isEmpty || _searchFuture == null
                  ? Center(
                      child: Text(
                        "Type something to search...",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  : FutureBuilder(
                      future: _searchFuture,
                      builder: (context, asyncSnapshot) {
                        if (asyncSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (asyncSnapshot.hasError) {
                          return Center(
                              child: Text(asyncSnapshot.error.toString()));
                        }
                        var response = asyncSnapshot.data;
                        var articles = response?.articles ?? [];

                        if (articles.isEmpty) {
                          return const Center(child: Text("No articles found"));
                        }

                        return Padding(
                          padding: REdgeInsets.symmetric(horizontal: 16),
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
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
