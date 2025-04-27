import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:k3carcare/models/horizontal_scroll.dart';
import 'package:k3carcare/widgets/appointment_card.dart';
import 'package:k3carcare/widgets/banner_slider.dart';
import 'package:k3carcare/widgets/services_divider.dart';

class HomeScreenNew extends StatelessWidget {
  const HomeScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 234, 231),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '📍Tarna',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                ),
                              ),
                               SizedBox(height: 4),
                              Text(
                                "Shivpur, Varanasi - 221003",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withValues(alpha: 0.4),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                              'assets/images/pfp.png',
                              fit: BoxFit.cover,
                              width: 48,
                              height: 48,
                              ),
                            ),
                            
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 47,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.3),
                              blurRadius: 12,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search for Items',
                                  hintStyle: TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const AppointmentCard(date: "Today", time: "2:00 pm"),
                const SizedBox(height: 20),
                const CustomDivider(text: 'Banners'),
                const SizedBox(height: 20),

                BannerSlider(           //////////  BANNER SLIDER //////////
                  height: 200.0,
                  assetPaths: [
                    'assets/images/banner/banner-1.png',
                    'assets/images/banner/banner-2.png',
                    'assets/images/banner/banner-3.png',
                    'assets/images/banner/banner-4.png',
                  ],
                  autoScrollDuration: const Duration(seconds: 3),
                ),
                const SizedBox(height: 20),
                const CustomDivider(text: 'Services'),
                const SizedBox(height: 20),
                Text(
                  "Services",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  height: MediaQuery.of(context).size.height / 2.8,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 10,
                                left: 10,
                                bottom: 10,
                                right: 5,
                              ),
                              height: 130,
                              width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    spreadRadius: -10,
                                    blurRadius: 30,
                                    offset: const Offset(0, 15),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  transform: GradientRotation(
                                    390 * 3.1415927 / 180,
                                  ), // Convert degrees to radians
                                  colors: [
                                    Color.fromRGBO(210, 0, 0, 1),
                                    Color.fromRGBO(252, 43, 16, 1),
                                    Color.fromRGBO(186, 172, 48, 1),
                                  ],
                                  stops: [0.0, 0.44, 1.0],
                                ),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Car\nServices",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          'assets/images/service.png',
                                        ),
                                        // height: 38,
                                        height: MediaQuery.of(context).size.height/23.3,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10,
                              right: 10,
                              bottom: 10,
                            ),
                            height: 130,
                            width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: -10,
                                  blurRadius: 30,
                                  offset: const Offset(0, 15),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                transform: GradientRotation(
                                  390 * 3.1415927 / 180,
                                ), // Convert degrees to radians
                                colors: [
                                  Color.fromRGBO(0, 210, 210, 1),
                                  Color.fromRGBO(16, 185, 252, 1),
                                  Color.fromRGBO(48, 82, 186, 1),
                                ],
                                stops: [0.0, 0.44, 1.0],
                              ),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Car\nWash",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        'assets/images/wash.png',
                                      ),
                                      height: 60,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10,
                              right: 10,
                              bottom: 10,
                            ),
                            height: 130,
                            width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: -10,
                                  blurRadius: 30,
                                  offset: const Offset(0, 15),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                transform: GradientRotation(
                                  390 * 3.1415927 / 180,
                                ), // Convert degrees to radians
                                colors: [
                                  Color.fromRGBO(158, 172, 0, 1),
                                  Color.fromRGBO(0, 158, 13, 1),
                                  Color.fromRGBO(38, 148, 77, 1),
                                ],
                                stops: [0.0, 0.44, 1.0],
                              ),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Car\nBatteries",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        'assets/images/battery.png',
                                      ),
                                      height: 54,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10,
                              bottom: 10,
                            ),
                            height: 130,
                            width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: -10,
                                  blurRadius: 30,
                                  offset: const Offset(0, 15),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                transform: GradientRotation(
                                  390 * 3.1415927 / 180,
                                ), // Convert degrees to radians
                                colors: [
                                  Color.fromRGBO(210, 0, 0, 1),
                                  Color.fromRGBO(252, 16, 16, 1),
                                  Color.fromRGBO(186, 48, 48, 1),
                                ],
                                stops: [0.0, 0.44, 1.0],
                              ),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "K3 Gold\nPlan",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        'assets/images/car-wash.png',
                                      ),
                                      height: MediaQuery.of(context).size.height/18,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const CustomDivider(text: 'Store'),
                Row(
                  children: [
                    Text(
                      "Store",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See More',
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
                HorizontalServicesList(),
                const SizedBox(height: 20),
                const CustomDivider(text: 'Warranty'),
                const SizedBox(height: 20),
                Text(
                  'Original Spare Parts',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                    right: 15,
                    left: 10,
                  ),
                  height: MediaQuery.of(context).size.height / 8.6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Extended Warranty with K3 Car Care",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                right: 15,
                                left: 10,
                              ),
                              height: 40,
                              width: 100,
                              child: SvgPicture.asset(
                                'assets/images/brands/bosch.svg',
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                right: 15,
                                left: 10,
                              ),
                              height: 19,
                              width: 100,
                              child: SvgPicture.asset(
                                'assets/images/brands/mahle.svg',
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                right: 15,
                                left: 10,
                              ),
                              height: 25,
                              width: 100,
                              child: Image.asset(
                                'assets/images/brands/ntn.png',
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                right: 15,
                                left: 10,
                              ),
                              height: 40,
                              width: 100,
                              child: Image.asset(
                                'assets/images/brands/textar.png',
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                right: 15,
                                left: 10,
                              ),
                              height: 35,
                              width: 100,
                              child: SvgPicture.asset(
                                'assets/images/brands/valeo.svg',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Center(child: const Text("Created for you with ❤", style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: 'Poppins'))),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
