import 'package:flutter/material.dart';
import 'package:golimo_driver/common/app_logo.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/core/consts/strings.dart';
import 'package:golimo_driver/feature/home_page/widgets/service_item.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBlack,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.sbH,
                const Center(child: AppLogo()),
                40.sbH,
                const AppText(
                  "Luxury",
                  size: 40,
                  weight: FontWeight.w800,
                ),
                const AppText(
                  "Car Rental",
                  size: 40,
                  weight: FontWeight.w800,
                ),
                const AppText(
                  "Book Your Luxury Car For Travel\n\Whenever You Want From Your Place",
                  size: 12,
                  color: AppColors.kGrayText,
                ),
                Image.asset(
                  "assets/png_images/home_bg_image.jpeg",
                  width: double.infinity,
                  height: 250,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ChooseServiceItem(
                        imagePath: "assets/svg_icons/airport_arrival.svg",
                        serviceType: ServiceTypes.Airport),
                    ChooseServiceItem(
                        imagePath: "assets/svg_icons/car_ride_limo.svg",
                        serviceType: ServiceTypes.Local),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ChooseServiceItem(
                        imagePath: "assets/svg_icons/car_ride_limo.svg",
                        serviceType: ServiceTypes.Rental),
                    ChooseServiceItem(
                        imagePath: "assets/svg_icons/travel_limo.svg",
                        serviceType: ServiceTypes.Travel),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
