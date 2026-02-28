import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_c17/core/resources/assets_manager.dart';
import 'package:news_c17/core/resources/strings_manager.dart';
import 'package:news_c17/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  final void Function(CategoryModel) selectCategory;
  const CategoryItem({super.key, required this.categoryModel,required this.index,required this.selectCategory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(categoryModel);
      },
      child: Directionality(
        textDirection: index.isOdd?TextDirection.rtl:TextDirection.ltr,
        child: Container(
          height:198.h ,
          padding: REdgeInsetsDirectional.only(
            end: 16
          ),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: Theme.of(context).colorScheme.primary
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(categoryModel.imagePath,height: 198.h,
              fit: BoxFit.cover,
                width: 150.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(categoryModel.title,style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: 32.sp
                  ),),
                  Container(
                    padding: REdgeInsetsDirectional.only(
                      bottom: 9,
                      top: 9,
                      start: 16
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary.withValues(
                        alpha: 0.5
                      ),
                      borderRadius: BorderRadius.circular(84.r)
                    ),
                    child: Row(
                      children: [
                        Text(StringsManager.viewAll,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w500
                        ),),
                        SizedBox(width: 10,),
                        CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          radius: 27.r,
                          child: SvgPicture.asset(AssetsManager.arrow,
                            matchTextDirection: true,
                            height: 24.h,width: 24.w,),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
