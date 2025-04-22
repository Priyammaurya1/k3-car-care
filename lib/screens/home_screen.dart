import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:k3carcare/models/horizontal_scroll.dart';

class HomeScreenNew extends StatelessWidget {
  const HomeScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 234, 231),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tarna,',
                                style: TextStyle(
                                  // fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              Text(
                                "Shivpur,Varanasi - 221003",
                                style: TextStyle(
                                  // fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: -10,
                                  blurRadius: 30,
                                  offset: const Offset(0, 15),
                                ),
                              ],
                              color: Colors.grey.shade400,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          height: 50,
                          width: 400,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                spreadRadius: -10,
                                blurRadius: 40,
                                offset: const Offset(0, 10),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search item',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                // BannerSlider(
                //   height: 200.0, // Set your desired height
                //   assetPaths: [
                //     'assets/images/banner/banner-1.png',
                //     'assets/images/banner/banner-2.png',
                //     'assets/images/banner/banner-3.png',
                //     'assets/images/banner/banner-4.png',
                //   ],
                //   autoScrollDuration: const Duration(seconds: 3),
                // ),

                /// Banner
                SizedBox(height: 24),
                Text(
                  "Services",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  height: MediaQuery.of(context).size.height / 3.9,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 10,
                                left: 10,
                                bottom: 10,
                                right: 10,
                              ),
                              height: 80,
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
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
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
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10,
                              right: 10,
                              bottom: 10,
                            ),
                            height: 80,
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
                                      height: 55,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10,
                              right: 10,
                              bottom: 10,
                            ),
                            height: 80,
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
                                      height: 45,
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
                            height: 80,
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
                                      "K3\nGold Plan",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
                                      height: 45,
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
                // SizedBox(height: 24),
                Row(
                  children: [
                    Text(
                      "Store",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See More',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                HorizontalServicesList(),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                    right: 15,
                    left: 10,
                  ),
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Original Spare Parts',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Extended Warranty with K3 Car Care",
                        style: TextStyle(color: Colors.grey[600], fontSize: 15),
                      ),
                      SizedBox(height: 10),
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
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
