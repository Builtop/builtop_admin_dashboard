import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/text.dart';
import 'package:builtop_admin_dashboard/constants/theme.dart';
import 'package:builtop_admin_dashboard/modules/lookups/country/country.model.dart';
import 'package:builtop_admin_dashboard/modules/lookups/country/country.service.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:flutter/material.dart';

class CountryDropDown extends StatefulWidget {
  final ValueChanged<Country> callback;

  final Map<String, String>? selectedValue;

  const CountryDropDown(this.callback, {this.selectedValue, super.key});

  @override
  State<CountryDropDown> createState() {
    return _CountryDropDownState();
  }
}

class _CountryDropDownState extends State<CountryDropDown> {
  List<Country>? countryList;

  @override
  void initState() {
    init();

    super.initState();
  }

  void init() async {
    var result = await CountryService.getCountries();
    if (result.success) {
      print(widget.selectedValue);
      countryList =
          List<Country>.from(result.data.map((e) => Country.fromJson(e)));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: countryList == null
          ? const Center(child: CircularProgressIndicator.adaptive()

              // Skeleton(
              //   height: 35,
              //   width: 500,
              // ),
              )
          : (countryList?.isEmpty ?? false)
              ? ConstText.mediumText(text: 'No Countries Found')
              : DropdownButtonHideUnderline(
                  child: CustomDropdown.search(
                  selectedValue: {"name": widget.selectedValue},
                  fieldSuffixIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: isDark ? Colors.white : null,
                  ),
                  listItemStyle: TextStyle(color: Colors.black),
                  fillColor: isDark ? ColorConst.cardDark : Colors.white,
                  contentPadding: EdgeInsets.all(10),
                  borderSide:
                      BorderSide(color: isDark ? Colors.grey : Colors.black87),
                  borderRadius: BorderRadius.circular(5),
                  hintText: 'Choose Country',
                  items: countryList?.map((e) => e.toJson()).toList() ?? [],
                  nameKey: "name",
                  nameMapKey: AppConfigService.language == "en" ? "en" : "ar",
                  onChanged: (value) {
                    print('=========-=-=-=--==-value ${value}');
                    widget.callback(countryList!
                        .firstWhere((element) => element.id == value["_id"]));
                  },
                )),
    );
  }
}
