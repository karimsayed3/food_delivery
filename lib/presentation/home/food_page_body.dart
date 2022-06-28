import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Widgets/big_text.dart';
import 'package:food_delivery/Widgets/icon_and_text_widget.dart';
import 'package:food_delivery/Widgets/small_text.dart';
import 'package:food_delivery/colors.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 300,
      child: PageView.builder(
        controller: pageController,
        itemBuilder: (context, position) {
          return _buildPageItem(position);
        },
        itemCount: 5,
      ),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
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
            height: 120,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Container(
              padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: 'Sandwitch'),
                  const SizedBox(
                    height: 10,
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
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(text: '4.5'),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(text: '200'),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(text: 'Comments'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
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
    );
  }
}
