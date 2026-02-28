import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_c17/core/resources/assets_manager.dart';
import 'package:news_c17/core/resources/strings_manager.dart';
import 'package:provider/provider.dart';
import 'package:news_c17/providers/settings_provider.dart';

class HomeDrawer extends StatelessWidget {
  final void Function() onPress;
  const HomeDrawer({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 166.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimaryContainer
              ),
              child: Text(StringsManager.appTitle,style: Theme.of(context).textTheme.headlineMedium,)),
          SizedBox(height: 16.h,),
          Padding(
            padding: REdgeInsets.symmetric(
              horizontal: 16
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    onPress();
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(AssetsManager.home,height: 24.h,width: 24.w,),
                      SizedBox(width: 8.w,),
                      Text(StringsManager.goToHome,style: Theme.of(context).textTheme.labelMedium,)
                    ],
                  ),
                ),
                Divider(
                  height: 48.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/roller-paint-brush.svg",height: 24.h,width: 24.w,),
                    SizedBox(width: 8.w,),
                    Text("Theme",style: Theme.of(context).textTheme.labelMedium,)
                  ],
                ),
                SizedBox(height: 8.h,),
                DropdownButtonFormField<String>(
                    isExpanded: true,
                    dropdownColor: Theme.of(context).colorScheme.primary,
                    initialValue: settingsProvider.isDark() ? "dark" : "light",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary
                          )
                      )
                    ),
                    items: [
                      DropdownMenuItem(
                          value:"dark" ,
                          child: Text("Dark",style: Theme.of(context).textTheme.labelMedium,)
                      ),
                      DropdownMenuItem(
                          value: "light",
                          child: Text("Light",style: Theme.of(context).textTheme.labelMedium)),
                    ],
                    onChanged: (value) {
                      if (value == "dark") {
                        settingsProvider.changeTheme(ThemeMode.dark);
                      } else {
                        settingsProvider.changeTheme(ThemeMode.light);
                      }
                    },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
