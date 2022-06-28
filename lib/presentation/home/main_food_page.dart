import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Widgets/big_text.dart';
import 'package:food_delivery/Widgets/small_text.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/presentation/home/food_page_body.dart';
import 'package:food_delivery/utils/dimantions.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Header Section
            Container(
              // color: Colors.amber,
              child: Container(
                margin: EdgeInsets.only(top: Dimantions.height20, bottom: Dimantions.height20),
                padding: EdgeInsets.only(left: Dimantions.width20, right: Dimantions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: 'Egypt',
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            SmallText(text: 'City',color: Colors.black45,),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimantions.width45,
                        height: Dimantions.height45,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimantions.radius15),
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Food Body Section
            FoodPageBody(),

          ],
        ),
      ),
    );
  }
}
