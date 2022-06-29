import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Widgets/big_text.dart';
import 'package:food_delivery/Widgets/icon_and_text_widget.dart';
import 'package:food_delivery/Widgets/small_text.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimantions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currentPageValue = 0.0;

  double _scaleFactor = 0.8;
  double _height = Dimantions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        // print(_currentPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider Section
        Container(
          // color: Colors.amber,
          height: Dimantions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
            itemCount: 5,
          ),
        ),

        // Dots Section
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimantions.radius5)),
          ),
        ),

        // Popular Food
        SizedBox(
          height: Dimantions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimantions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(
                width: Dimantions.width10,
              ),
              Container(
                child: SmallText(
                  text: '.',
                  color: Colors.black45,
                ),
              ),
              SizedBox(
                width: Dimantions.width10,
              ),
              Container(
                  child: SmallText(
                text: 'Food Pairing',
              )),
            ],
          ),
        ),

        Container(
          height: 600,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                width: 120,
                height: 120,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimantions.radius15),
                        image:  DecorationImage(
                          image: AssetImage(
                            'assets/images/ss.png'
                          ),
                        )
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();

    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimantions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimantions.width10, right: Dimantions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimantions.radius30),
              color: index.isEven
                  ? const Color(0xff69c5df)
                  : const Color(0xff9294cc),
              // image: const DecorationImage(
              //   fit: BoxFit.cover,
              //   image: AssetImage('assets/images/ss.png'),
              // ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimantions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimantions.width20,
                  right: Dimantions.width20,
                  bottom: Dimantions.height15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimantions.radius30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: Dimantions.radius15,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    right: Dimantions.width15,
                    left: Dimantions.width15,
                    top: Dimantions.height10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Sandwitch'),
                    SizedBox(
                      height: Dimantions.sizeHeight10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => (Icon(
                              Icons.star,
                              size: 15,
                              color: AppColors.mainColor,
                            )),
                          ),
                        ),
                        SizedBox(
                          width: Dimantions.sizeWidth10,
                        ),
                        SmallText(text: '4.5'),
                        SizedBox(
                          width: Dimantions.sizeWidth10,
                        ),
                        SmallText(text: '200'),
                        SizedBox(
                          width: Dimantions.sizeWidth10,
                        ),
                        SmallText(text: 'Comments'),
                      ],
                    ),
                    SizedBox(
                      height: Dimantions.sizeHeight10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          iconColor: AppColors.iconColor1,
                          text: 'Normal',
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          iconColor: AppColors.mainColor,
                          text: '1.7km',
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          iconColor: AppColors.iconColor2,
                          text: '32min',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
