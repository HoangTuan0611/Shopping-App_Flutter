import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/view/checkout/checkout_view.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: GetBuilder<CartViewModel>(
            init: Get.find(),
            builder: (controller) => controller.cartProductModel.length == 0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/cart_empty.svg',
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: 'Cart Empty',
                        fontSize: 28,
                        alignment: Alignment.topCenter,
                      )
                    ],
                  )
                : Container(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                            height: 140,
                            child: Row(
                              children: [
                                Container(
                                  width: 140,
                                  child: Image.network(
                                    controller.cartProductModel[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25, right: 10, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: controller
                                            .cartProductModel[index].name,
                                        fontSize: 20,
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      CustomText(
                                        color: primaryColor,
                                        text: controller
                                                .cartProductModel[index].price +
                                            ' \VND',
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Container(
                                          width: 140,
                                          color: Colors.grey.shade200,
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .decreaseQuantity(index);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 20),
                                                  child: Icon(
                                                    Icons.minimize,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              CustomText(
                                                alignment: Alignment.center,
                                                fontSize: 20,
                                                color: Colors.black,
                                                text: controller
                                                    .cartProductModel[index]
                                                    .quantity
                                                    .toString(),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              GestureDetector(
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                                onTap: () {
                                                  controller
                                                      .increaseQuantity(index);
                                                },
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ));
                      },
                      itemCount: controller.cartProductModel.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  CustomText(
                    text: 'TOTAL',
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 15,
                  ),
                  // ignore: prefer_const_constructors
                  GetBuilder<CartViewModel>(
                    init: Get.find(),
                    builder: (controller) => CustomText(
                      text: '${controller.totalPrice}  \ VND',
                      fontSize: 18,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: CustomButton(
                  onPress: () {
                    Get.to(CheckOutView());
                  },
                  text: 'CHECK OUT',
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
