


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiltone_storecommon/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:jiltone_storecommon/widgets/texts/section_heading.dart';
import 'package:jiltone_storeutils/constants/colors.dart';
import 'package:jiltone_storeutils/constants/image_strings.dart';
import 'package:jiltone_storeutils/constants/sizes.dart';
import 'package:jiltone_storeutils/helpers/helper_functions.dart';

import '../../../controllers/product/checkout_controller.dart';

class HkBillingPaymentSection extends StatelessWidget {
  const HkBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark = HkHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        HkSectionHeading(title: 'Payment Method',showActionButton: true,
          onPressed: () => controller.selectPaymentMethod(context),
          buttonTitle: 'Change',),
        const SizedBox(height: HkSizes.spaceBtwItems / 2,),
        Obx(
          () => Row(
            children: [
              HkRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? HkColors.light : HkColors.white,
                padding: const EdgeInsets.all(HkSizes.sm),
                child: Image(image: AssetImage(controller.selectedPaymentMethod.value.image),fit: BoxFit.contain,),
              ),
              const SizedBox(width: HkSizes.spaceBtwItems / 2,),
              Text(controller.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge,)
            ],
          ),
        )
      ],
    );
  }
}
