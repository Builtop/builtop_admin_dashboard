import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/icons.dart';
import 'package:builtop_admin_dashboard/constants/images.dart';
import 'package:builtop_admin_dashboard/constants/string.dart';
import 'package:builtop_admin_dashboard/constants/theme.dart';
import 'package:builtop_admin_dashboard/modules/dashboard/dashboard.controller.dart';
import 'package:builtop_admin_dashboard/modules/login/login.page.dart';
import 'package:builtop_admin_dashboard/routes/routes.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:builtop_admin_dashboard/utils/extensions.dart';
import 'package:builtop_admin_dashboard/utils/hover.dart';
import 'package:builtop_admin_dashboard/utils/responsive.dart';
import 'package:builtop_admin_dashboard/utils/text_utility.dart';
import 'package:builtop_admin_dashboard/widgets/end_drawer.dart';
import 'package:builtop_admin_dashboard/widgets/expansion_tile.dart';
import 'package:builtop_admin_dashboard/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutterx/flutterx.dart';
import 'package:builtop_admin_dashboard/routes/app_routes.gr.dart' as gr;

class MenuBarPage extends StatefulWidget {
  final Widget Function()? body;
  const MenuBarPage({Key? key, this.body}) : super(key: key);

  @override
  State<MenuBarPage> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBarPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldDrawerKey =
      GlobalKey<ScaffoldState>();
  PointerDownEvent? mouseEvent;

  final ScrollController _scrollController = ScrollController();

  ValueNotifier<bool> isOpen = ValueNotifier(true);
  ValueNotifier<bool> isSubListOpen = ValueNotifier(false);

  final ValueNotifier<TextDirection> _layout = ValueNotifier<TextDirection>(
      AppConfigService.isArabic ? TextDirection.rtl : TextDirection.ltr);

  Map<String, String> mainData = {
    Strings.dashboard: IconlyBroken.home,
  };

  Map<String, String> usersData = {
    Strings.users: IconlyBroken.users,
  };
  Map<String, String> requestsData = {
    Strings.requests: IconlyBroken.requests,
  };
  Map<String, String> lookupsData = {
    Strings.lookups: IconlyBroken.archive,
  };

  List<List<String>> requestsDataList = [
    [
      Strings.rfq,
      Strings.rfp,
    ],
  ];
  List<List<String>> usersExpandList = [
    [
      Strings.supervisors,
      Strings.suppliers,
      Strings.buyers,
      Strings.pendingUsers
    ],
  ];
  List<List<String>> lookupsExpandList = [
    [Strings.countries, Strings.cities],
  ];

  final List<String> _items = [
    Strings.profile,
    Strings.settings,
  ];

  final List<String> _notificationTitle = [
    'Your order is shipped',
    'your accound have verified',
    'New Notification arrived',
  ];

  final List<String> _notificationSubtitle = [
    'Please share your experience with us',
    'Congratulation  👏🏻',
    'Hey!, How are you?',
  ];
  final List<PageRouteInfo<dynamic>> routes = [
    gr.DashboardRoute(controllerEx: null),
    gr.SupervisorsRoute(),
    gr.SuppliersRoute(),
    gr.BuyersRoute(),
    gr.PendingUsersRoute(),
    gr.SupervisorDetailsRoute(),
    gr.SupplierDetailsRoute(),
    gr.BuyerDetailsRoute(),
    gr.PendingUsersDetailsRoute(),
    gr.RfqRoute(),
    gr.AdminDetailsRoute(),
    gr.CountryRoute(),
    gr.CityRoute(),
    gr.CityDetailsRoute(),
  ];

  // for change language
  final ValueNotifier<String> _language =
      ValueNotifier<String>(AppConfigService.language);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: routes,
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        autoTabRouter = tabsRouter;
        return ValueListenableBuilder<TextDirection>(
            valueListenable: _layout,
            builder: (context, value, _) {
              return Directionality(
                textDirection: value,
                child: Scaffold(
                  key: _scaffoldKey,
                  endDrawer: Drawer(
                    width: 280,
                    child: SafeArea(
                      child: SettingDrawer(scaffoldKey: _scaffoldKey),
                    ),
                  ),
                  appBar: _appBar(tabsRouter),
                  body: SafeArea(
                    child: Scaffold(
                      key: _scaffoldDrawerKey,
                      // drawerScrimColor: ColorConst.transparent,
                      drawer: _sidebar(tabsRouter),
                      body: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ValueListenableBuilder<bool>(
                            valueListenable: isOpen,
                            builder: (context, value, child) {
                              return Responsive.isWeb(context)
                                  ? _sidebar(tabsRouter)
                                  : const SizedBox.shrink();
                            },
                          ),
                          (widget.body != null)
                              ? widget.body?.call() ?? const SizedBox()
                              : Expanded(
                                  child: CustomScrollView(
                                    controller: _scrollController,
                                    slivers: [
                                      SliverList(
                                        delegate: SliverChildListDelegate(
                                          [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (!upperCase(tabsRouter
                                                          .currentPath)
                                                      // .camelCase()
                                                      .trim()
                                                      .contains(Strings
                                                          .landingPage)) ...[
                                                    FxBox.h20,
                                                    Text(
                                                      translate(
                                                          'body.${upperCase(tabsRouter.currentPath).trim().toLowerCase()}'),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    FxBox.h8,
                                                    _routesDeatils(tabsRouter),
                                                    FxBox.h20,
                                                  ],
                                                  getRouteWidget(
                                                      tabsRouter.activeIndex),
                                                  FxBox.h20,
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SliverFillRemaining(
                                        hasScrollBody: false,
                                        fillOverscroll: true,
                                        child: Column(
                                          children: <Widget>[
                                            const Expanded(
                                              child: SizedBox.shrink(),
                                            ),
                                            _footer(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }

  /// appbar
  PreferredSizeWidget _appBar(TabsRouter tabsRouter) => AppBar(
        toolbarHeight: 70,
        elevation: 0.0,
        shadowColor: ColorConst.transparent,
        leadingWidth: 392,
        leading: Row(
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: isOpen,
              builder: (context, value, child) {
                if (Responsive.isWeb(context) && value) {
                  _scaffoldDrawerKey.currentState!.closeDrawer();
                  return InkWell(
                    onTap: () {
                      tabsRouter
                          .setActiveIndex(getRouteIndex(Strings.dashboard));
                      _scaffoldDrawerKey.currentState?.closeDrawer();
                    },
                    child: Container(
                      width: 240,
                      padding: const EdgeInsets.symmetric(horizontal: 61),
                      height: double.infinity,
                      color: ColorConst.transparent,
                      child: Image.asset(isDark
                          ? Images.builtopSmLogoWh
                          : Images.builtopSmLogo),
                    ),
                  );
                }
                return InkWell(
                  onTap: () {
                    tabsRouter.setActiveIndex(getRouteIndex(Strings.dashboard));
                    _scaffoldDrawerKey.currentState?.closeDrawer();
                  },
                  child: Container(
                    width: 60,
                    height: double.infinity,
                    color:
                        isDark ? ColorConst.transparent : ColorConst.drawerBG,
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(Images.smLogo, fit: BoxFit.contain),
                  ),
                );
              },
            ),
            MaterialButton(
              height: double.infinity,
              minWidth: 60,
              hoverColor: ColorConst.transparent,
              onPressed: () async {
                if (Responsive.isMobile(context) ||
                    Responsive.isTablet(context)) {
                  if (_scaffoldDrawerKey.currentState!.isDrawerOpen) {
                    _scaffoldDrawerKey.currentState!.closeDrawer();
                  } else {
                    _scaffoldDrawerKey.currentState!.openDrawer();
                  }
                } else if (Responsive.isWeb(context)) {
                  _scaffoldDrawerKey.currentState!.closeDrawer();
                  isOpen.value = !isOpen.value;
                }
              },
              child: SvgIcon(
                icon: IconlyBroken.drawer,
                color: AppConfigService.isDark
                    ? ColorConst.white
                    : ColorConst.black,
              ),
            )
          ],
        ),
        actions: [
          if (Responsive.isWeb(context)) ...[
            ValueListenableBuilder<String>(
              valueListenable: _language,
              builder: (context, value, _) {
                return InkWell(
                  onTap: () => changeLanguage(value),
                  child: Text(
                    AppConfigService.isArabic ? 'ar' : 'en',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      AppConfigService.isDark = !AppConfigService.isDark;
                    },
                    icon: Icon(
                      isDark
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                    ),
                  ),
                ],
              ),
            )
          ],
          _notification(),
          _profile(tabsRouter),
          if (!Responsive.isWeb(context))
            MenuBar(
              style: MenuStyle(
                backgroundColor:
                    MaterialStateProperty.all(ColorConst.transparent),
                elevation: MaterialStateProperty.all(0.0),
                fixedSize: const MaterialStatePropertyAll(Size(60.0, 60.0)),
                // shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(100.0))),
              ),
              children: [
                SubmenuButton(
                  style: ButtonStyle(
                    fixedSize: const MaterialStatePropertyAll(Size(40.0, 40.0)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0)),
                    ),
                  ),
                  menuStyle: const MenuStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.zero),
                  ),
                  menuChildren: [
                    SizedBox(
                      height: 40.0,
                      child: MenuItemButton(
                        onPressed: () {
                          AppConfigService.isDark = !AppConfigService.isDark;
                        },
                        child: MenuAcceleratorLabel(
                            isDark ? 'Light mode' : 'Dark mode'),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                      child: MenuItemButton(
                        onPressed: () => changeLanguage(_language.value),
                        child: MenuAcceleratorLabel(
                            _language.value == 'en' ? 'Arabic' : 'English'),
                      ),
                    ),
                  ],
                  child: SvgIcon(
                    icon: IconlyBroken.setting,
                    color: AppConfigService.isDark
                        ? ColorConst.white
                        : ColorConst.black,
                  ),
                ),
              ],
            ),
        ],
      );

  // TextDirection _layout(String layout)
  // {
  //     if(layout == 'RTL')
  //     {
  //       return TextDirection.rtl;
  //     }
  //     else
  //     {
  //       return TextDirection.ltr;
  //     }
  // }

  Widget _notification() {
    return Listener(
        onPointerDown: (event) => mouseEvent = event,
        child: FxDropdownButton(
          focusColor: Colors.transparent,
          underline: FxBox.shrink,
          customButton: MaterialButton(
            height: double.infinity,
            minWidth: 60,
            hoverColor: ColorConst.transparent,
            onPressed: null,
            child: SvgIcon(
              icon: IconlyBroken.notification,
              color:
                  AppConfigService.isDark ? ColorConst.white : ColorConst.black,
            ),
          ),
          customItemsIndexes: const [1],
          customItemsHeight: 0,
          onChanged: (value) {},
          dropdownWidth: 300,
          dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
          dropdownDecoration: BoxDecoration(
            color: isDark ? ColorConst.cardDark : Colors.white,
            border: Border.all(
              color: isDark
                  ? ColorConst.lightGrey.withOpacity(0.1)
                  : ColorConst.lightGrey.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          scrollbarAlwaysShow: false,
          dropdownElevation: 0,
          offset: AppConfigService.isArabic
              ? const Offset(246, 0)
              : const Offset(-246, 0),
          itemHeight: 300,
          items: [
            DropdownMenuItem(
              alignment: AlignmentDirectional.topStart,
              value: '',
              child: SizedBox(
                height: 300,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 8.0),
                          child: Text(
                            '${Strings.notifications} (258)',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FxBox.h8,
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _notificationTitle.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                title: Text(
                                  _notificationTitle[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  _notificationSubtitle[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .color!
                                            .withOpacity(0.5),
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
                        const Divider(color: ColorConst.lightGrey, height: 8.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              Strings.viewAll,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _profile(TabsRouter tabsRouter) {
    return FxDropdownButton(
      focusColor: Colors.transparent,
      underline: const SizedBox.shrink(),
      customButton: MaterialButton(
        height: double.infinity,
        minWidth: 60,
        hoverColor: ColorConst.transparent,
        onPressed: null,
        child: SvgIcon(
          icon: IconlyBroken.profile,
          size: 22,
          color: AppConfigService.isDark ? ColorConst.white : ColorConst.black,
        ),
      ),
      customItemsIndexes: const [2],
      customItemsHeight: 8,
      onChanged: (value) {
        if (value == 'Profile') {
          // context.router.push(const MenuBar());
          context.navigateNamedTo('/adminDetails');

          _scaffoldDrawerKey.currentState?.closeDrawer();
        }
      },
      items: [
        ..._items.map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const DropdownMenuItem<Divider>(
          enabled: false,
          child: Divider(color: ColorConst.lightGrey),
        ),
        const DropdownMenuItem(
          value: 'Logout',
          child: Text(
            Strings.logout,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
      itemHeight: 40,
      itemPadding: const EdgeInsets.only(left: 16, right: 16),
      dropdownWidth: 160,
      dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
      dropdownDecoration: BoxDecoration(
        color: isDark ? ColorConst.cardDark : Colors.white,
        border: Border.all(
          color: isDark
              ? ColorConst.lightGrey.withOpacity(0.1)
              : ColorConst.lightGrey.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      dropdownElevation: 0,
      offset: AppConfigService.isArabic
          ? const Offset(108, 0)
          : const Offset(-108, 0),
    );
  }

  /// drawer / sidebar
  Widget _sidebar(TabsRouter tabsRouter) => ValueListenableBuilder<bool>(
      valueListenable: isSubListOpen,
      builder: (context, value1, child) {
        return ValueListenableBuilder<bool>(
          valueListenable: isOpen,
          builder: (context, value, child) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: value || value1 ? 240 : 70,
              color:
                  isDark ? ColorConst.darkModeBackGround : ColorConst.drawerBG,
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxBox.h8,
                    // main
                    // if (value) _menuHeading(Strings.main),
                    _menuList(
                      tabsRouter: tabsRouter,
                      items: mainData,
                      isopen: value,
                    ),
                    // components
                    // if (value) _menuHeading(Strings.components),
                    _menuList(
                      tabsRouter: tabsRouter,
                      items: requestsData,
                      isExpanded: true,
                      children: requestsDataList,
                      isopen: value,
                    ),
                    _menuList(
                      tabsRouter: tabsRouter,
                      items: usersData,
                      isExpanded: true,
                      children: usersExpandList,
                      isopen: value,
                    ),
                    _menuList(
                      tabsRouter: tabsRouter,
                      items: lookupsData,
                      isExpanded: true,
                      children: lookupsExpandList,
                      isopen: value,
                    ),

                    FxBox.h20,
                  ],
                ),
              ),
            );
          },
        );
      });

  /// menu heading
  // Widget _menuHeading(String title) {
  //   return Container(
  //     padding: const EdgeInsets.only(left: 18),
  //     height: 40,
  //     alignment: Alignment.centerLeft,
  //     child: Text(
  //       title.toUpperCase(),
  //       style: TextStyle(
  //         color: isDark ? ColorConst.white : ColorConst.black,
  //         fontSize: 11,
  //       ),
  //     ),
  //   );
  // }

  /// menu list
  Widget _menuList({
    required TabsRouter tabsRouter,
    required Map<String, String> items,
    bool isExpanded = false,
    List<List<String>> children = const [],
    required bool isopen,
  }) {
    print('=========================${tabsRouter.currentPath}');
    print('=========================${upperCase(tabsRouter.currentPath)}');

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) => FxHover(
        builder: (isHover) {
          Color color = isHover
              ? isDark
                  ? ColorConst.chartForgoundColor
                  : ColorConst.primary
              : isDark
                  ? ColorConst.white
                  : ColorConst.black;
          if (isExpanded) {
            return isopen
                ? FxExpansionTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FxBox.w(22.0),
                        SvgIcon(
                          icon: items.values.elementAt(index),
                          size: 20,
                          color: children[index]
                                  .contains(upperCase(tabsRouter.currentPath))
                              ? isDark
                                  ? ColorConst.chartForgoundColor
                                  : ColorConst.primary
                              : color,
                        ),
                        FxBox.w(24.0),
                      ],
                    ),
                    title: Text(
                      translate(
                          'body.${items.keys.elementAt(index).toLowerCase()}'),
                      style: TextStyle(
                          color: children[index]
                                  .contains(upperCase(tabsRouter.currentPath))
                              ? isDark
                                  ? ColorConst.chartForgoundColor
                                  : ColorConst.primary
                              : color,
                          fontSize: 15.7),
                    ),
                    trailing: SvgIcon(
                      icon: IconlyBroken.arrowDown,
                      size: 16,
                      color: children[index]
                              .contains(upperCase(tabsRouter.currentPath))
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                    ),
                    children: [_subMenuList(children[index], tabsRouter)],
                  )
                : ListTile(
                    leading: SvgIcon(
                      icon: items.values.elementAt(index),
                      size: isopen ? 18 : 22,
                      color: items.keys.elementAt(index) ==
                              upperCase(tabsRouter.currentPath)
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                    ),
                    title: isopen
                        ? Text(
                            items.keys.elementAt(index),
                            style: TextStyle(
                              color: items.keys.elementAt(index) ==
                                      upperCase(tabsRouter.currentPath)
                                  ? isDark
                                      ? ColorConst.chartForgoundColor
                                      : ColorConst.primary
                                  : color,
                              fontSize: 15.7,
                            ),
                          )
                        : null,
                    mouseCursor: SystemMouseCursors.click,
                    horizontalTitleGap: 0.0,
                    onTap: () {
                      isOpen.value = true;
                      _scaffoldDrawerKey.currentState?.closeDrawer();
                    },
                  );
          } else {
            return Row(
              children: [
                if (isopen)
                  Container(
                    width: 6.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: items.keys.elementAt(index) ==
                              upperCase(tabsRouter.currentPath)
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : ColorConst.transparent,
                      borderRadius: BorderRadius.only(
                        topRight: englishRadiusForSelector,
                        bottomRight: englishRadiusForSelector,
                        topLeft: arabicRadiusForSelector,
                        bottomLeft: arabicRadiusForSelector,
                      ),
                    ),
                  ),
                if (isopen) FxBox.w16,
                Expanded(
                  child: ListTile(
                    leading: SvgIcon(
                      icon: items.values.elementAt(index),
                      size: isopen ? 16 : 20,
                      color: items.keys.elementAt(index) ==
                              upperCase(tabsRouter.currentPath)
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                    ),
                    title: isopen
                        ? Text(
                            translate(
                                'body.${items.keys.elementAt(index).toLowerCase()}'),
                            style: TextStyle(
                              color: items.keys.elementAt(index) ==
                                      upperCase(tabsRouter.currentPath)
                                  ? isDark
                                      ? ColorConst.chartForgoundColor
                                      : ColorConst.primary
                                  : color,
                              fontSize: 15.7,
                            ),
                          )
                        : null,
                    mouseCursor: SystemMouseCursors.click,
                    horizontalTitleGap: 24,
                    onTap: () {
                      print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1');
                      isOpen.value = true;

                      tabsRouter.setActiveIndex(
                          getRouteIndex(items.keys.elementAt(index)));
                      // HiveUtils.set(Strings.selectedmenuIndex,
                      //     getRouteIndex(items.keys.elementAt(index)));
                      _scaffoldDrawerKey.currentState?.closeDrawer();
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Radius get englishRadiusForSelector => AppConfigService.isArabic
      ? const Radius.circular(0.0)
      : const Radius.circular(6.0);
  Radius get arabicRadiusForSelector => AppConfigService.isArabic
      ? const Radius.circular(6.0)
      : const Radius.circular(0.0);

  Widget _tempMenuList({
    required TabsRouter tabsRouter,
    required List<String> items1,
    bool isExpanded = false,
    List<List<String>> children = const [],
    required bool isopen,
    required bool isSubListopen,
  }) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items1.length,
      itemBuilder: (context, index) => FxHover(
        builder: (isHover) {
          Color color = isHover
              ? isDark
                  ? ColorConst.chartForgoundColor
                  : ColorConst.primary
              : isDark
                  ? ColorConst.white
                  : ColorConst.black;
          if (isExpanded) {
            return isopen
                ? FxExpansionTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FxBox.w(22.0),
                        FxBox.w(24.0),
                      ],
                    ),
                    title: Text(
                      items1[index],
                      style: TextStyle(
                          color: children[index]
                                  .first
                                  .contains(upperCase(tabsRouter.currentPath))
                              // languageModel
                              //         .translate(children[index].first.camelCase())
                              //         .contains(upperCase(tabsRouter.currentPath))
                              ? isDark
                                  ? ColorConst.chartForgoundColor
                                  : ColorConst.primary
                              : color,
                          fontSize: 15.7),
                    ),
                    trailing: SvgIcon(
                      icon: IconlyBroken.arrowDown,
                      size: 16,
                      color: children[index]
                              .first
                              .camelCase()
                              .contains(upperCase(tabsRouter.currentPath))
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                    ),
                    children: [_subMenuList(children[index], tabsRouter)],
                  )
                : ListTile(
                    title: isopen
                        ? Text(
                            items1[index].camelCase(),
                            style: TextStyle(
                              color: items1[index].camelCase().contains(
                                      upperCase(tabsRouter.currentPath))
                                  ? isDark
                                      ? ColorConst.chartForgoundColor
                                      : ColorConst.primary
                                  : color,
                              fontSize: 15.7,
                            ),
                          )
                        : null,
                    mouseCursor: SystemMouseCursors.click,
                    horizontalTitleGap: 0.0,
                    onTap: () {
                      isOpen.value = true;
                      _scaffoldDrawerKey.currentState?.closeDrawer();
                    },
                  );
          } else {
            return Row(
              children: [
                if (isopen)
                  Container(
                    width: 6.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: items1[index]
                              .camelCase()
                              .contains(upperCase(tabsRouter.currentPath))
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : ColorConst.transparent,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(6.0),
                        bottomRight: Radius.circular(6.0),
                      ),
                    ),
                  ),
                if (isopen) FxBox.w16,
                Expanded(
                  child: ListTile(
                    title: isopen
                        ? Text(
                            items1[index].camelCase(),
                            style: TextStyle(
                              color: items1[index].contains(
                                      upperCase(tabsRouter.currentPath))
                                  ? isDark
                                      ? ColorConst.chartForgoundColor
                                      : ColorConst.primary
                                  : color,
                              fontSize: 15.7,
                            ),
                          )
                        : null,
                    mouseCursor: SystemMouseCursors.click,
                    horizontalTitleGap: 0.0,
                    onTap: () {
                      print('xxxxxxxxxxxxxxxxxx2');
                      isOpen.value = true;

                      tabsRouter.setActiveIndex(getRouteIndex(items1[index]));
                      // HiveUtils.set(Strings.selectedmenuIndex,
                      //     getRouteIndex(items1[index]));
                      _scaffoldDrawerKey.currentState?.closeDrawer();
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _menuList1({
    required TabsRouter tabsRouter,
    required Map<String, String> items,
    required List<String> items1,
    bool isExpanded = false,
    List<List<String>> children = const [],
    required bool isopen,
    required bool isSubListopen,
  }) {
    return FxHover(
      builder: (isHover) {
        Color color = isHover
            ? isDark
                ? ColorConst.chartForgoundColor
                : ColorConst.primary
            : isDark
                ? ColorConst.white
                : ColorConst.black;
        return isopen
            ? FxExpansionTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FxBox.w(22.0),
                    SvgIcon(
                      icon: items.values.elementAt(0),
                      size: 16,
                      color: children[0]
                              .contains(upperCase(tabsRouter.currentPath))
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                    ),
                    FxBox.w(24.0),
                  ],
                ),
                title: Text(
                  items.keys.elementAt(0).replaceFirst('-', ' '),
                  style: TextStyle(
                      color: children[0]
                              .contains(upperCase(tabsRouter.currentPath))
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                      fontSize: 15.7),
                ),
                trailing: SvgIcon(
                  icon: IconlyBroken.arrowDown,
                  size: 16,
                  color: children[0].contains(upperCase(tabsRouter.currentPath))
                      ? isDark
                          ? ColorConst.chartForgoundColor
                          : ColorConst.primary
                      : color,
                ),
                children: [
                  _tempMenuList(
                    items1: items1,
                    tabsRouter: tabsRouter,
                    isExpanded: true,
                    children: children,
                    isopen: isopen,
                    isSubListopen: isSubListopen,
                  ),
                ],
              )
            : ListTile(
                leading: SvgIcon(
                  icon: items.values.elementAt(0),
                  size: isopen ? 16 : 18,
                  color: items.keys.elementAt(0) ==
                          upperCase(tabsRouter.currentPath)
                      ? isDark
                          ? ColorConst.chartForgoundColor
                          : ColorConst.primary
                      : color,
                ),
                mouseCursor: SystemMouseCursors.click,
                horizontalTitleGap: 0.0,
                onTap: () {
                  isOpen.value = true;
                  _scaffoldDrawerKey.currentState?.closeDrawer();
                },
              );
      },
    );
  }

  /// sub menu list
  Widget _subMenuList(List<String> items, TabsRouter tabsRouter) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => FxHover(
        builder: (isHover) {
          Color color = isHover
              ? isDark
                  ? ColorConst.chartForgoundColor
                  : ColorConst.primary
              : _checkSubRoute(tabsRouter.currentPath) == items[index]
                  ? isDark
                      ? ColorConst.chartForgoundColor
                      : ColorConst.primary
                  : upperCase(tabsRouter.currentPath) == items[index]
                      ? isDark
                          ? ColorConst.chartForgoundColor
                          : ColorConst.primary
                      : isDark
                          ? ColorConst.white
                          : ColorConst.black;
          return Row(
            children: [
              if (_checkSubRoute(tabsRouter.currentPath) == items[index]) ...[
                Container(
                  width: 6.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color:
                        _checkSubRoute(tabsRouter.currentPath) == items[index]
                            ? isDark
                                ? ColorConst.chartForgoundColor
                                : ColorConst.primary
                            : ColorConst.transparent,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(6.0),
                      bottomRight: Radius.circular(6.0),
                    ),
                  ),
                ),
              ],
              Container(
                width: 6.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: upperCase(tabsRouter.currentPath) == items[index]
                      ? isDark
                          ? ColorConst.chartForgoundColor
                          : ColorConst.primary
                      : ColorConst.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(6.0),
                    bottomRight: Radius.circular(6.0),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -3),
                  mouseCursor: SystemMouseCursors.click,
                  contentPadding: AppConfigService.isArabic
                      ? EdgeInsets.only(right: 52.0)
                      : EdgeInsets.only(left: 52.0),
                  title: Text(
                    // items[index],
                    items[index],
                    style: TextStyle(color: color, fontSize: 15),
                  ),
                  onTap: () {
                    print('xxxxxxxxxxxxxxx3${items[index]}');
                    print('index : ${getRouteIndex(items[index])}');

                    tabsRouter.setActiveIndex(getRouteIndex(items[index]));

                    _scaffoldDrawerKey.currentState?.closeDrawer();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void changeLanguage(String value) async {
    if (value == 'en' || value == '') {
      changeLocale(context, 'ar');

      _language.value = 'ar';
      _layout.value = TextDirection.rtl;
    } else {
      changeLocale(context, 'en');

      _language.value = 'en';
      _layout.value = TextDirection.ltr;
    }
    AppConfigService.language = _language.value;
  }

  /// routes
  Widget _routesDeatils(TabsRouter tabsRouter) {
    // int routeIndex = getRouteIndex(tabsRouter.currentPath
    //     .substring(0, tabsRouter.currentPath.length)
    //     .replaceAll('-', ' ')
    //     .capitalize());
    int routeIndex =
        getRouteIndex(tabsRouter.currentPath.substring(1).capitalize());

    return Row(
      children: (tabsRouter.currentPath == '/dashboard')
          ? []
          : [
              if (routeIndex.isBetween(1, 4)) ...[
                Text('${'Users'} '),
              ] else if (routeIndex == 5) ...[
                Text('${'Users'} / ${'Supervisors'} '),
              ] else if (routeIndex == 6) ...[
                Text('${'Users'} / ${'Suppliers'} '),
              ] else if (routeIndex == 7) ...[
                Text('${'Users'} / ${'Buyers'} '),
              ] else if (routeIndex == 8) ...[
                Text('${'Users'} / ${'Pending-users'} '),
              ] else if (routeIndex == 10) ...[
                Text('${'Admin'} '),
              ] else if (routeIndex == 11 || routeIndex == 12) ...[
                Text('${'Lookups'} '),
              ] else if (routeIndex == 13) ...[
                Text('${'Cities'} '),
              ] else ...[
                // const Text(' / Extra Pages '),
                Text(' / ${'not found page'} '),
              ],
              const Text(' / '),
              // Text(upperCase(tabsRouter.currentPath)),
              Text(upperCase(tabsRouter.currentPath).trim()),
            ],
    );
  }

  Widget _footer() => Container(
        color: isDark ? ColorConst.footerDark : ColorConst.drawerBG,
        height: 60,
        width: Responsive.isWeb(context)
            ? MediaQuery.of(context).size.width - 240
            : MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: const Text(Strings.footerText),
      );

  String _checkSubRoute(String path) {
    if (upperCase(path) == 'Products Detail') {
      return 'Products';
    } else if (upperCase(path) == 'Sub Category') {
      return 'Category';
    } else if (upperCase(path) == 'Vender Detail') {
      return 'Vender';
    } else if (upperCase(path) == 'Return Order Invoice') {
      return 'Return Order';
    } else if (upperCase(path) == 'Order Invoice') {
      return 'Order';
    } else {
      return '';
    }
  }
}
