import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';

import 'package:news_c17/core/resources/colors_manager.dart';
import 'package:news_c17/model/category_model.dart';
import 'package:news_c17/ui/articles/widget/articles_list.dart';

import '../../../model/sources_response/source.dart';
import '../../../model/sources_response/sources_response.dart';

class ArticlesScreen extends StatefulWidget {
  final CategoryModel category;
  const ArticlesScreen({super.key, required this.category});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse?>(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, asyncSnapshot) {
        if(asyncSnapshot.connectionState == ConnectionState.waiting){
          // loading state
          return Center(child: CircularProgressIndicator(),);
        }
        if(asyncSnapshot.hasError){
          // error state
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(asyncSnapshot.error.toString()),
              ElevatedButton(onPressed: () {

              }, child: Text("Try Again"))
            ],
          );
        }
        // success state
        var response = asyncSnapshot.data;
        List<Source> sources = response?.sources??<Source>[];
        return DefaultTabController(
          length: sources.length,
          child: Column(
            children: [
              TabBar(
                  labelStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.lightPrimaryColor
                  ),
                  unselectedLabelStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.lightPrimaryColor
                  ),
                  dividerHeight: 0,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: sources.map((source) =>Tab(
                    text: source.name,
                  ) ,).toList()
              ),
              Expanded(child: TabBarView(
                  children: sources.map((source) => ArticlesList(sourceId: source.id??""),).toList()
              ))
            ],
          ),
        );
      }
    );
  }
}

