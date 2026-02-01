import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jiltone_storecommon/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:jiltone_storefeatures/shop/controllers/product/checkout_controller.dart';
import 'package:jiltone_storefeatures/shop/models/payment_method_model.dart';
import 'package:jiltone_storeutils/constants/sizes.dart';
import 'package:jiltone_storeutils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';

class HkPaymentTile extends StatelessWidget {
  const HkPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: HkRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: HkHelperFunctions.isDarkMode(context) ? HkColors.light : HkColors.white,
        padding: const EdgeInsets.all(HkSizes.sm),
        child: Image(image: AssetImage(paymentMethod.image),fit: BoxFit.contain,),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
