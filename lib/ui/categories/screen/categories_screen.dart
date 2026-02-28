import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/resources/strings_manager.dart';
import 'package:news_c17/model/category_model.dart';
import 'package:news_c17/ui/categories/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final void Function(CategoryModel) selectCategory;
  const CategoriesScreen({super.key, required this.selectCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        children: [
          Text(StringsManager.welcome,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w500
          ),),
          SizedBox(height: 16.h,),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => CategoryItem(
                  selectCategory: selectCategory,
                  index: index,
                  categoryModel: CategoryModel.categories[index],
                ),
                separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                itemCount: CategoryModel.categories.length
            ),
          )
        ],
      ),
    );
  }
}
