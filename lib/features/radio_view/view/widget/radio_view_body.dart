import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:islami_app/core/shared/shared_pref_hive.dart';
import 'package:islami_app/features/radio_view/ViewModel/providers/radio_provider.dart';
import 'package:islami_app/features/radio_view/models/RadioModel.dart';
import 'package:islami_app/features/radio_view/models/RecitersModel.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources_app.dart';
import 'custom_build_radio_item.dart';
import 'custom_build_tab_radio.dart';

class RadioBodyView extends StatefulWidget {
  const RadioBodyView({super.key});
  @override
  State<RadioBodyView> createState() => _RadioBodyViewState();
}

class _RadioBodyViewState extends State<RadioBodyView> {
  @override
  void initState() {
    Provider.of<RadioProvider>(context, listen: false).getRadio();
    Provider.of<RadioProvider>(context, listen: false).getReciters();
    super.initState();
  }

  final bool isSelected = true;
  List<String> tapRadioList = [AppText.radio, AppText.reciters];
  int currentIndexTap = 0;
  String currentUrl = "";
  AudioPlayer playerRadio = AudioPlayer();
  AudioPlayer playerReciters = AudioPlayer();
  int currentIndexRadio = 0;
  double currentVolume = 0.5;
  @override
  Widget build(BuildContext context) {
    final radioProvider = Provider.of<RadioProvider>(context, listen: false);
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        DefaultTabController(
          length: 2,
          child: TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            onTap: (value) async {
              setState(() {
                currentIndexTap = value;
              });
              if (value == 0 && radioProvider.getRadio().toString().isEmpty) {
                await context.read<RadioProvider>().getRadio();
              }
              if (value == 1 &&
                  radioProvider.getReciters().toString().isEmpty) {
                await context.read<RadioProvider>().getReciters();
              }
            },
            tabs: List.generate(2, (index) {
              return CustomBuildTabRadio(
                size: size,
                title: tapRadioList[index],
                isSelected: currentIndexTap == index,
              );
            }),
          ),
        ),
        const SizedBox(height: 18),
        Expanded(
          child: currentIndexTap == 0
              ? FutureBuilder<RadioModel?>(
                  future: radioProvider.getRadio(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == .waiting) {
                      return Center(
                        child: const CircularProgressIndicator(
                          constraints: BoxConstraints(
                            maxWidth: 30,
                            maxHeight: 25,
                            minWidth: 20,
                            minHeight: 20,
                          ),
                          color: AppColor.goldColor,
                        ),
                      );
                    }
                    if (snapshot.hasError || !snapshot.hasData) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: AppTextStyle.textS20Style,
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data?.radios?.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data?.radios?[index];
                        return CustomBuildBodyItemRadio(
                          size: size,
                          title: item?.name ?? "",
                          isPlaying:
                              currentIndexRadio == index && playerRadio.playing,
                          play: () {
                            onPlay(url: "${item?.url}005.mp3");
                            currentIndexRadio = index;
                            setState(() {});
                          },
                          increaseVolume: () {
                            increaseVolume();
                          },
                          decreaseVolume: () {
                            decVolume();
                          },
                        );
                      },
                    );
                  },
                )
              : FutureBuilder<RecitersModel?>(
                  future: radioProvider.getReciters(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == .waiting) {
                      return Center(
                        child: const CircularProgressIndicator(
                          constraints: BoxConstraints(
                            maxWidth: 30,
                            maxHeight: 25,
                            minWidth: 20,
                            minHeight: 20,
                          ),
                          color: AppColor.goldColor,
                        ),
                      );
                    }
                    if (snapshot.hasError || !snapshot.hasData) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: AppTextStyle.textS20Style,
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data?.reciters?.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data?.reciters?[index];
                        return CustomBuildBodyItemRadio(
                          size: size,
                          title: item?.name ?? "",
                          isPlaying:
                              currentIndexRadio == index &&
                              playerReciters.playing,
                          play: () async {
                            onPlay(
                              url: "${item?.moshaf?.first.server}005.mp3",
                              isRadio: false,
                            );
                            currentIndexRadio = index;
                            setState(() {});
                          },
                          increaseVolume: () {
                            increaseVolume(isRadio: false);
                          },
                          decreaseVolume: () {
                            decVolume(isRadio: false);
                          },
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  Future<void> onPlay({
    required final String url,
    final bool isRadio = true,
  }) async {
    AudioPlayer currentPlayer = isRadio ? playerRadio : playerReciters;
    if (isRadio) {
      if (playerReciters.playing) {
        playerReciters.stop();
      }
    } else {
      if (playerRadio.playing) {
        playerRadio.stop();
      }
    }

    if (url == currentUrl) {
      if (currentPlayer.playing) {
        currentPlayer.stop();
      } else {
        currentPlayer.play();
      }
      return;
    }
    currentPlayer.stop();
    currentUrl = url;
    currentPlayer.setUrl(url);
    currentPlayer.play();
    log("is Playing");
  }

  void increaseVolume({
    bool isRadio = true,
  }) {
    final AudioPlayer currentPlayer = isRadio ? playerRadio : playerReciters;
    if (currentVolume >= 1) {
      return;
    }
    currentVolume = (currentVolume + 0.2).clamp(0.0, 10.0);
    currentPlayer.setVolume(currentVolume);
  }

  void decVolume({final bool isRadio = true}) {
    if (currentVolume <= 0) {
      return;
    } else {
      AudioPlayer currentPlayer = isRadio ? playerRadio : playerReciters;
      currentVolume = (currentVolume - 0.2).clamp(0.0, 1.0);
      currentPlayer.setVolume(currentVolume);
    }
  }
}
