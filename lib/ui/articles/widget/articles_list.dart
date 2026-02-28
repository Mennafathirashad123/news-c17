import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/ui/articles/widget/article_item.dart';

import '../../../model/articles_response/article.dart';
import '../../../model/articles_response/articles_response.dart';

class ArticlesList extends StatelessWidget {
  final String sourceId;
  const ArticlesList({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponse?>(
      future: ApiManager.getArticles(sourceId),
      builder: (context, asyncSnapshot) {
        if(asyncSnapshot.connectionState == ConnectionState.waiting){
          // loading state
          return Center(child: CircularProgressIndicator(),);
        }
        if(asyncSnapshot.hasError){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(asyncSnapshot.error.toString()),
              ElevatedButton(onPressed: () {

              }, child: Text("Try Again"))
            ],
          );
        }
        var response = asyncSnapshot.data;
        List<Article> articles = response?.articles??<Article>[];
        return Padding(
          padding: REdgeInsets.all(16),
          child: ListView.separated(
              itemBuilder: (context, index) => ArticleItem(
                article: articles[index],
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16.h,),
              itemCount: articles.length
          ),
        );
      }
    );
  }
}
