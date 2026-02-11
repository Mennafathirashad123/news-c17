import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/core/resources/app_constants.dart';
import 'package:news_c17/core/resources/colors_manager.dart';
import 'package:news_c17/model/category_model.dart';
import 'package:news_c17/ui/articles/widget/articles_list.dart';

class ArticlesScreen extends StatefulWidget {
  CategoryModel category;
  ArticlesScreen(this.category);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiManager.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppConstants.dummySources.length,
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
              tabs: AppConstants.dummySources.map((source) =>Tab(
                text: source,
              ) ,).toList()
          ),
          Expanded(child: TabBarView(
              children: AppConstants.dummySources.map((source) => ArticlesList(),).toList()
          ))
        ],
      ),
    );
  }
}

