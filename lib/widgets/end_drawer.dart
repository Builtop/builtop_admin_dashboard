import 'package:builtop_admin_dashboard/constants/icons.dart';
import 'package:builtop_admin_dashboard/constants/images.dart';
import 'package:builtop_admin_dashboard/constants/string.dart';
import 'package:builtop_admin_dashboard/widgets/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class SettingDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SettingDrawer({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<SettingDrawer> createState() => _SettingDrawerState();
}

class _SettingDrawerState extends State<SettingDrawer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.settings,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.scaffoldKey.currentState!.closeEndDrawer();
                  },
                  child: const SvgIcon(icon: IconlyBroken.closeSquare),
                ),
              ],
            ),
          ),
          const Divider(height: 0),
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              Strings.chooseLayouts,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                FxBox.h8,
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: Image.asset(
                    Images.light,
                    fit: BoxFit.cover,
                  ),
                ),
                FxBox.h8,
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: Image.asset(
                    Images.dark,
                    fit: BoxFit.cover,
                  ),
                ),
                FxBox.h8,
                // Row(
                //   children: [
                //     BlocBuilder<ThemeModeBloc, ThemeModeState>(
                //       builder: (context, state) {
                //         return CupertinoSwitch(
                //           value: HiveUtils.isContainKey(HiveKeys.themeMode)
                //               ? HiveUtils.get(HiveKeys.themeMode)
                //               : false,
                //           onChanged: (value) {
                //             HiveUtils.set(HiveKeys.themeMode, value);
                //             themeModeBloc
                //                 .add(ThemeModeEvent.changeTheme(value));
                //           },
                //         );
                //       },
                //     ),
                //     const Text(
                //       Strings.darkMode,
                //       style: TextStyle(
                //         fontSize: 15,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     )
                //   ],
                // ),
                // FxBox.h8,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
