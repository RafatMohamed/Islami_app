import 'package:flutter/material.dart';
import 'package:islami_app/core/resources_app.dart';
import 'package:islami_app/core/service/quran_service/quran_service.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: CustomTextFormField(
            onChanged: (query) {
              QuranService.onSearch(query);
              setState(() {});
            },
          ),
        ),
        Expanded(
          child: QuranService.isSearchView
              ? SearchView(filteredSearch: QuranService.filteredSearch)
              : const BodyQuranView(),
        ),
      ],
    );
  }
}
