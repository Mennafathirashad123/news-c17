import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.network(
        "https://gizmodo.com/app/uploads/2026/01/shutterstock_2708601327-1200x675.jpg",
        height:220,
        width: double.infinity,

      ),
      Text("40-year-old man falls 200 feet to his death while canyoneering at national park",style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontSize: 16.sp
      ),)
    ],);
  }
}
