# Islami | Flutter Islamic Content App

A Flutter project combining locally bundled Quran/Hadith content, azkar, a digital sebha and online radio/reciter lists.

## Features

- Browse Quran surahs and open their text from bundled assets.
- Search the surah list and keep a locally saved recently viewed list.
- Browse Hadith content loaded from local text assets.
- Read azkar loaded from bundled JSON data.
- Use a tap-based digital sebha with a counter and rotating visual.
- Load radio and reciter lists from MP3Quran API endpoints.
- Audio playback controls with play/pause and volume adjustment.
- Onboarding flow with local state stored in Hive.

## Structure and state management

Feature folders separate Quran, Hadith, azkar, sebha, radio and onboarding. Services load local content or HTTP responses; Provider supplies radio/reciter data, and `just_audio` handles playback.

## Main packages

`provider`, `http`, `just_audio`, `hive_flutter` and `flutter_svg`.

## Getting started

Use a Flutter installation whose bundled Dart SDK satisfies `^3.12.2`, as declared in `pubspec.yaml`.

```bash
git clone https://github.com/RafatMohamed/Islami_app.git
cd Islami_app
flutter pub get
```

1. Bundled content lives in `assets/text/` and `assets/json/`. Keep these asset paths aligned with `pubspec.yaml`.
2. An internet connection is required for the MP3Quran radio/reciter requests and audio playback.

After completing the configuration above:

```bash
flutter run
```

## Current scope and limitations

- The Time tab is currently a placeholder displaying text; prayer-time calculation is not implemented there.
- Radio/reciter playback constructs audio URLs in code, including a fixed `005.mp3` suffix. Live stream and recitation availability need runtime testing.
- This README describes source-code implementation. Builds, external services and user flows have not been run as part of this documentation review.

## Code guide

- [`lib/core/service/quran_service/quran_service.dart`](lib/core/service/quran_service/quran_service.dart)
- [`lib/core/service/hadeth_service/hadeth_service.dart`](lib/core/service/hadeth_service/hadeth_service.dart)
- [`lib/features/azkar_view/services/azkar_services.dart`](lib/features/azkar_view/services/azkar_services.dart)
- [`lib/features/sebha_view/view/widget/sebha_body_view.dart`](lib/features/sebha_view/view/widget/sebha_body_view.dart)
- [`lib/features/radio_view/view/widget/radio_view_body.dart`](lib/features/radio_view/view/widget/radio_view_body.dart)
- [`lib/features/time_view/view/time_view.dart`](lib/features/time_view/view/time_view.dart)
