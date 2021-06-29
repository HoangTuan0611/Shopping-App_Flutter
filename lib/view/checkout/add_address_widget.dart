import 'package:ecommerce_app/core/view_model/checkout_view_model.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
        init: Get.find(),
        builder: (controller) => Form(
              key: controller.formState,
              child: Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            CustomText(
                              text:
                                  'Billing address is the same as delivery address',
                              fontSize: 20,
                              alignment: Alignment.center,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            CustomTextFormField(
                              text: 'Steet 1',
                              hint: '16, Ngo Quyen',
                              onSave: (value) {
                                controller.street1 = value;
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'You must write your street';
                                }
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            CustomTextFormField(
                              text: 'Steet 2',
                              hint: 'Floor 5, Room 2, Sunshine apartment',
                              onSave: (value) {
                                controller.street2 = value;
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'You must write your street 2';
                                }
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            CustomTextFormField(
                              onSave: (value) {
                                controller.city = value;
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'You must write your city';
                                }
                              },
                              text: 'City',
                              hint: 'Bien Hoa city',
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: Get.width,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: CustomTextFormField(
                                        text: 'State',
                                        hint: 'Dong Nai',
                                        onSave: (value) {
                                          controller.state = value;
                                        },
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return 'You must write your state';
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: CustomTextFormField(
                                        text: 'Country',
                                        hint: 'Viet Nam',
                                        onSave: (value) {
                                          controller.country = value;
                                        },
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return 'You must write your country';
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))),
            ));
  }
}
