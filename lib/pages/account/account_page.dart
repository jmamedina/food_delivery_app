import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/data/controllers/auth_controller.dart';
import 'package:food_delivery/data/controllers/cart_controller.dart';
import 'package:food_delivery/data/controllers/user_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();

    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(text: "Profile", size: 24, color: Colors.white),
        ),
        body: GetBuilder<UserController>(builder: (userController) {
          return _userLoggedIn
              ? (userController.isLoading
                  ? Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimensions.height20),
                      child: Column(
                        children: [
                          //Profile icon
                          AppIcon(
                            icon: Icons.person,
                            backgroundColor: AppColors.mainColor,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height45 + Dimensions.height30,
                            size: Dimensions.height15 * 10,
                          ),
                          SizedBox(height: Dimensions.height30),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      backgroundColor: AppColors.mainColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userMode.name),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                  //Phone
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userMode.phone),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                  //email
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userMode.email),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                  //address
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(text: ""),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                  //message
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.message_outlined,
                                      backgroundColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(text: ""),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.message_outlined,
                                      backgroundColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(text: ""),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                  GestureDetector(
                                    onTap: () {
                                      if (Get.find<AuthController>()
                                          .userLoggedIn()) {
                                        Get.find<AuthController>()
                                            .clearSharedData();
                                        Get.find<CartController>().clear();
                                        Get.find<CartController>()
                                            .clearCartHistory();
                                        Get.offNamed(
                                            RouteHelper.getSignInPage());
                                      }
                                    },
                                    child: AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.logout,
                                        backgroundColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                        iconSize: Dimensions.height10 * 5 / 2,
                                        size: Dimensions.height10 * 5,
                                      ),
                                      bigText: BigText(text: "ログアウト"),
                                    ),
                                  ),

                                  SizedBox(height: Dimensions.height20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(child: CircularProgressIndicator()))
              : GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      RouteHelper.getSignInPage(),
                    );
                  },
                  child: Container(
                    child: Center(
                      child: Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 5,
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20)),
                          child: BigText(
                              text: "Sign in",
                              color: Colors.white,
                              size: Dimensions.font20)),
                    ),
                  ),
                );
        }));
  }
}
