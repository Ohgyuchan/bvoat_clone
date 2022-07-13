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
  CrewTabBarView({Key? key}) : super(key: key);
  final GetAnimationController animationController =
      Get.put(GetAnimationController());
  final height = 620.0;
  final width = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _firstContainer(),
            _secondContainer(),
          ],
        ),
      ),
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
              VisibilityDetector(
                key: const Key('first'),
                onVisibilityChanged: (info) => info.visibleBounds == Rect.zero
                    ? animationController.first.value = false
                    : animationController.first.value = true,
                child: OpacityAnimatedWidget.tween(
                  opacityEnabled: 1, //define start value
                  opacityDisabled: 0, //and end value(
                  enabled: animationController.first.value,
                  child: TranslationAnimatedWidget.tween(
                    enabled: animationController.first.value,
                    translationDisabled: const Offset(0, 100),
                    translationEnabled: const Offset(0, 0),
                    child: SizedBox(
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '💰\n마일리지\n무제한 2배 적립',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.headline2,
                          ),
                          Text(
                            '횟수 무제한 가치소비 마일리지 자동 2% 적립',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              VisibilityDetector(
                key: const Key('second'),
                onVisibilityChanged: (info) => info.visibleBounds == Rect.zero
                    ? animationController.second.value = false
                    : animationController.second.value = true,
                child: OpacityAnimatedWidget.tween(
                  opacityEnabled: 1, //define start value
                  opacityDisabled: 0, //and end value(
                  enabled: animationController.second.value,
                  child: TranslationAnimatedWidget.tween(
                    enabled: animationController.second.value,
                    translationDisabled: const Offset(0, 100),
                    translationEnabled: const Offset(0, 0),
                    child: SizedBox(
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '✍️\n소비기록\n마일리지 5배 적립',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.headline2,
                          ),
                          Text(
                            '가치소비 리뷰 작성 시 건당 최대 1,000점 적립',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              VisibilityDetector(
                key: const Key('third'),
                onVisibilityChanged: (info) => info.visibleBounds == Rect.zero
                    ? animationController.third.value = false
                    : animationController.third.value = true,
                child: OpacityAnimatedWidget.tween(
                  opacityEnabled: 1, //define start value
                  opacityDisabled: 0, //and end value(
                  enabled: animationController.third.value,
                  child: TranslationAnimatedWidget.tween(
                    enabled: animationController.third.value,
                    translationDisabled: const Offset(0, 100),
                    translationEnabled: const Offset(0, 0),
                    child: SizedBox(
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '😎\n비보트 크루\n전용 뱃지 노출',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.headline2,
                          ),
                          Text(
                            '비보트 크루 전용 뱃지 커뮤니티, 프로필(예정) 노출',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              VisibilityDetector(
                key: const Key('forth'),
                onVisibilityChanged: (info) => info.visibleBounds == Rect.zero
                    ? animationController.forth.value = false
                    : animationController.forth.value = true,
                child: OpacityAnimatedWidget.tween(
                  opacityEnabled: 1, //define start value
                  opacityDisabled: 0, //and end value(
                  enabled: animationController.forth.value,
                  child: TranslationAnimatedWidget.tween(
                    enabled: animationController.forth.value,
                    translationDisabled: const Offset(0, 100),
                    translationEnabled: const Offset(0, 0),
                    child: SizedBox(
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '📦\n10% 할인 쿠폰,\n무료배송 쿠폰 지급',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.headline2,
                          ),
                          Text(
                            '10% 할인 쿠폰, 무료 배송 쿠폰 바로 지급',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              VisibilityDetector(
                key: const Key('fifth'),
                onVisibilityChanged: (info) => info.visibleBounds == Rect.zero
                    ? animationController.fifth.value = false
                    : animationController.fifth.value = true,
                child: OpacityAnimatedWidget.tween(
                  opacityEnabled: 1, //define start value
                  opacityDisabled: 0, //and end value(
                  enabled: animationController.fifth.value,
                  child: TranslationAnimatedWidget.tween(
                    enabled: animationController.fifth.value,
                    translationDisabled: const Offset(0, 100),
                    translationEnabled: const Offset(0, 0),
                    child: SizedBox(
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '📮\nWHAT\'S NEXT?',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.headline2,
                          ),
                          Text(
                            '비보트 크루 전용 혜택은 지속적으로 추가됩니다.',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ),
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
            '비보트 크루\n전용 혜택',
            textAlign: TextAlign.center,
            style: Get.textTheme.headline1,
          ),
          textFlag(
            '가치소비, 훨씬 쉬워쥡니다.',
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
                      '너,',
                      style: Get.textTheme.headline1,
                    ),
                    Text(
                      '우리의 크루가',
                      style: Get.textTheme.headline1,
                    ),
                    Text(
                      '되어라!',
                      style: Get.textTheme.headline1,
                    ),
                  ],
                ),
                textFlag(
                  '가치소비로 함께 세상을 바꿀 수 있도록.',
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
                  '하루의 시작부터 끝까지 우리는 선택합니다.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      '누군가는 선택후 그것이 더 나은 선택이었길 바라지만,',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '어떤 사람들은 실제로 더 가치 있는 선택을 합니다.',
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
                      '비보트는 가치를 선택하는 사람들,',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '비보트 크루와 함께 세상을 바꿉니다.',
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
              onTap: () {},
              child: Column(
                children: const [
                  Text(
                    '크루 가입 바로가기',
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
