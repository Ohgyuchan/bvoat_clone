import 'package:animated_widgets/animated_widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bvoat_clone/theme/app_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bvoat_clone/pages/data/product_repository.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import 'get_animation_controller.dart';

class CrewTabBarView extends StatelessWidget {
  CrewTabBarView({Key? key, required this.terms}) : super(key: key);
  final Widget terms;
  final GetAnimationController animationController =
      Get.put(GetAnimationController());
  final height = 620.0;
  final width = Get.width;
  final _keys = <Key>[
    const Key('first'),
    const Key('second'),
    const Key('third'),
    const Key('forth'),
    const Key('fifth'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SingleChildScrollView(
            controller: animationController.scrollController.value,
            child: Column(
              children: [
                _firstContainer(),
                _secondContainer(),
                terms,
              ],
            ),
          )),
    );
  }

  Widget texts(int index, RxBool isShown, String headline, String bodyText) {
    return Column(
      children: [
        VisibilityDetector(
          key: _keys[index],
          onVisibilityChanged: (info) => info.visibleBounds == Rect.zero
              ? isShown.value = false
              : isShown.value = true,
          child: OpacityAnimatedWidget.tween(
            opacityEnabled: 1, //define start value
            opacityDisabled: 0, //and end value(
            enabled: isShown.value,
            child: TranslationAnimatedWidget.tween(
              enabled: isShown.value,
              translationDisabled: const Offset(0, 100),
              translationEnabled: const Offset(0, 0),
              child: SizedBox(
                height: 140,
                child: Text(
                  headline,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.headline2,
                ),
              ),
            ),
          ),
        ),
        Text(
          bodyText,
          textAlign: TextAlign.center,
          style: Get.textTheme.bodyText1,
        ),
      ],
    );
  }

  Container _thirdContainer() {
    return Container(
      height: height * 2,
      width: width / 1.08,
      color: Colors.black,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          gradient: RadialGradient(
            colors: [
              AppColor.instance.kBlueBlur,
              AppColor.instance.kBlueBlur,
              Colors.blueGrey,
            ],
            radius: 2.0,
          ),
        ),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              texts(0, animationController.first, '????\n????????????\n????????? 2??? ??????',
                  '?????? ????????? ???????????? ???????????? ?????? 2% ??????'),
              texts(1, animationController.second, '??????\n????????????\n???????????? 5??? ??????',
                  '???????????? ?????? ?????? ??? ?????? ?????? 1,000??? ??????'),
              texts(2, animationController.third, '????\n????????? ??????\n?????? ?????? ??????',
                  '????????? ?????? ?????? ?????? ????????????, ?????????(??????) ??????'),
              texts(3, animationController.forth, '????\n10% ?????? ??????,\n???????????? ?????? ??????',
                  '10% ?????? ??????, ?????? ?????? ?????? ?????? ??????'),
              texts(4, animationController.fifth, '????\nWHAT\'S NEXT?',
                  '????????? ?????? ?????? ????????? ??????????????? ???????????????.'),
              GestureDetector(
                onTap: () async {
                  await animationController.goInitialOffset();
                },
                child: Column(
                  children: const [
                    Icon(
                      Icons.keyboard_double_arrow_up_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      '?????? ??????',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _secondContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 64,
      ),
      height: height * 3,
      width: width,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '????????? ??????\n?????? ??????',
            textAlign: TextAlign.center,
            style: Get.textTheme.headline1,
          ),
          textFlag(
            '????????????, ?????? ???????????????.',
            AppColor.instance.kBlue,
          ),
          Stack(
            children: [
              SizedBox(
                height: 160,
                child: CarouselSlider(
                  items: List.generate(
                    ProductsRepository.loadProducts().length,
                    (index) => Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(
                        ProductsRepository.loadProducts()
                            .elementAt(index)
                            .getAssetName,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    height: 150,
                    viewportFraction: 0.4,
                    autoPlay: true,
                    autoPlayCurve: Curves.linear,
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 1000,
                    ),
                    autoPlayInterval: const Duration(
                      milliseconds: 1000,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Text(
                  'VOTE FOR\nBETTER TOMORROW',
                  style: Get.textTheme.headline4,
                ),
              ),
            ],
          ),
          _thirdContainer()
        ],
      ),
    );
  }

  Container _firstContainer() {
    return Container(
      height: height,
      width: width,
      color: AppColor.instance.kBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '???,',
                      style: Get.textTheme.headline1,
                    ),
                    Text(
                      '????????? ?????????',
                      style: Get.textTheme.headline1,
                    ),
                    Text(
                      '?????????!',
                      style: Get.textTheme.headline1,
                    ),
                  ],
                ),
                textFlag(
                  '??????????????? ?????? ????????? ?????? ??? ?????????.',
                  Colors.black38,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '????????? ???????????? ????????? ????????? ???????????????.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      '???????????? ????????? ????????? ??? ?????? ??????????????? ????????????,',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '?????? ???????????? ????????? ??? ?????? ?????? ????????? ?????????.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      '???????????? ????????? ???????????? ?????????,',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '????????? ????????? ?????? ????????? ????????????.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          WidgetAnimator(
            atRestEffect: WidgetRestingEffects.wave(
              duration: const Duration(
                milliseconds: 2000,
              ),
            ),
            child: GestureDetector(
              onTap: () async {
                await animationController.goLastOffset();
              },
              child: Column(
                children: const [
                  Text(
                    '?????? ?????? ????????????',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_double_arrow_down_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container textFlag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
