import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/core/service/quran_service/quran_service.dart';
import 'package:islami_app/features/quran_view/model/sura_info_model.dart';
import 'package:islami_app/features/quran_view/view/widget/body_quran_view.dart';
import 'package:islami_app/features/quran_view/view/widget/search_view.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class QuranView extends StatefulWidget {
  static const String routeName = "/${AppText.quranViewApp}";
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  bool isSearchView = false;
  late TextEditingController controller;
  List<SuraInfoModel> filteredSearch = [];
  final List<SuraInfoModel> allSura = QuranService.allSura;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onSearch(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        filteredSearch.clear();
        isSearchView = false;
      } else {
        filteredSearch = allSura.where((element) {
          return element.nameAr.toLowerCase().contains(
                query.toString().toLowerCase(),
              ) ||
              element.nameEN.toLowerCase().contains(
                query.toString().toLowerCase(),
              );
        }).toList();
        isSearchView = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .start,
      children: [
        CustomTextFormField(controller: controller, onChanged: onSearch),
        Expanded(
          child: isSearchView
              ? SearchView(filteredSearch: filteredSearch)
              : const BodyQuranView(),
        ),
      ],
    );
  }
}