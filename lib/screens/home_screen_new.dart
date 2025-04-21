import 'package:flutter/material.dart';
import 'package:k3carcare/models/horizontal_scroll.dart';

import 'package:k3carcare/widgets/banner_section_store.dart';

class HomeScreenNew extends StatelessWidget {
  const HomeScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  decoration: BoxDecoration(color: Colors.black12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Welcome,',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              Text(
                                "Priyam Maurya",
                                style: TextStyle(
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
                          decoration: BoxDecoration(
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
                BannerSection(),                         /// Banner
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
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 15),
                  height: MediaQuery.of(context).size.height / 3.8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.black54),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12)),
                          ),
                          Spacer(),
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12)),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12)),
                          ),
                          Spacer(),
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12)),
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
                    TextButton(onPressed: (){}, child: Text('See More')),
                  ],
                ),
                HorizontalServicesList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}