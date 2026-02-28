import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/resources/colors_manager.dart';
import 'package:provider/provider.dart';
import 'package:news_c17/providers/settings_provider.dart';

import 'package:url_launcher/url_launcher.dart';
import '../../../model/articles_response/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItem extends StatelessWidget {
  final Article article;

  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    bool isDark = settingsProvider.isDark();

    return GestureDetector(
      onTap: () {
        _showArticleBottomSheet(context);
      },
      child: Container(
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.transparent,
          border: Border.all(color: isDark ? Colors.white38 : ColorsManager.lightPrimaryColor),
        ),
        child: Column(
          spacing: 10.h,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                height: 220.h,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error_outline_rounded, size: 40.sp)),
              ),
            ),
            Text(
              article.title ?? "",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontSize: 16.sp),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "By : ${article.author}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Text(
                  timeago.format(DateTime.parse(article.publishedAt!)),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showArticleBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? "",
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error_outline, size: 40.sp)),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                article.description ?? article.title ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 16.sp, color: Colors.black87),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () async {
                    if (article.url != null) {
                      final Uri url = Uri.parse(article.url!);
                      if (!await launchUrl(url)) {
                        debugPrint('Could not launch $url');
                      }
                    }
                  },
                  child: Text(
                    "View Full Article",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
