import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:muj_verse_beta/account/account_screen.dart';
import 'package:muj_verse_beta/core/bottom_nav.dart';
import 'package:muj_verse_beta/homepage/26_bus.dart';
import 'package:muj_verse_beta/homepage/academic_calander.dart';
import 'package:muj_verse_beta/homepage/book_cab.dart';
import 'package:muj_verse_beta/login%20screen/login_screen.dart';
import 'package:muj_verse_beta/login%20screen/new_initial.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final promoBannerHeight = ((screenWidth - 40) / 2.65);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 255),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 41, 51, 65),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return AccountScreen();
                    }));
                  },
                  icon: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 232, 240, 255),
                    child: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 41, 51, 65),
                    ),
                  )),
              Column(
                children: [
                  Text(
                    'muj verse',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'got you covered',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Badge(
                    largeSize: 15,
                    smallSize: 15,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 232, 240, 255),
                      child: Icon(
                        Icons.notifications_sharp,
                        color: Color.fromARGB(255, 41, 51, 65),
                      ),
                    ),
                  ))
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 50 + promoBannerHeight,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 20 + (promoBannerHeight / 2),
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 50,
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 41, 51, 65),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(55),
                                bottomRight: Radius.circular(55))),
                      ),
                      SizedBox(
                        height: promoBannerHeight / 2,
                      ),
                    ],
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    right: 20,
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        width: double.infinity,
                        height: promoBannerHeight,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 141, 141, 141)
                                      .withOpacity(0.3),
                                  blurRadius: 10.0,
                                  spreadRadius: 3)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 1,
                            height: promoBannerHeight,
                            autoPlay: true,
                            // autoPlayInterval: Duration(seconds: 5)
                          ),
                          items: [
                            Image.asset('assets/home_promo.png',
                                fit: BoxFit.fill),
                            Image.asset('assets/home_promo2.png',
                                fit: BoxFit.fill),
                            Image.asset('assets/home_promo3.png',
                                fit: BoxFit.fill),
                          ],
                        )),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return NewInitialScreen();
                    }));
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 214, 214, 214)
                                  .withOpacity(0.5),
                              blurRadius: 10.0,
                              spreadRadius: 3)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/home_rewards.png',
                          scale: 11,
                        ),
                        Text(
                          'Rewards and coupons',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 124, 131, 145)),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            surfaceTintColor: Colors.transparent,
                            title: Text('Please Verify Email'),
                            actions: [
                              TextButton(
                                onPressed: () {},
                                child: Text('OK'),
                              )
                            ],
                            content: Image.asset('assets/verify_email.png'),
                          );
                        });
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: const Color.fromARGB(255, 214, 214, 214)
                                  .withOpacity(0.5),
                              blurRadius: 10.0,
                              spreadRadius: 3)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/home_events.png',
                          scale: 11,
                        ),
                        Text(
                          'All Upcoming Events',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 124, 131, 145)),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: const Color.fromARGB(255, 214, 214, 214)
                                  .withOpacity(0.5),
                              blurRadius: 10.0,
                              spreadRadius: 3)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/home_party.png',
                          scale: 11,
                        ),
                        Text(
                          'Party Center',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 124, 131, 145)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 250,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(255, 214, 214, 214)
                          .withOpacity(0.5),
                      blurRadius: 10.0,
                      spreadRadius: 3)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'QUICK SERVICES',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AcademicCalenderScreen.routeName);
                        },
                        child: Container(
                          height: 83,
                          width: 50,
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 219, 231, 253),
                                maxRadius: 25,
                                child: Icon(
                                  Icons.calendar_month_outlined,
                                  size: 25,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'academic calender',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey.shade600),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(BusTimingScreen.routeName);
                        },
                        child: Container(
                          height: 80,
                          width: 50,
                          child: Column(
                            children: [
                              CircleAvatar(
                                maxRadius: 25,
                                backgroundColor:
                                    Color.fromARGB(255, 219, 231, 253),
                                child: Icon(
                                  Icons.directions_bus_outlined,
                                  size: 25,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '26 no. bus',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey.shade600),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(BookCabScreen.routeName);
                        },
                        child: Container(
                          height: 80,
                          width: 50,
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 219, 231, 253),
                                maxRadius: 25,
                                child: Icon(
                                  Icons.local_taxi_outlined,
                                  size: 25,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'book cab',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey.shade600),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 55,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 219, 231, 253),
                              maxRadius: 25,
                              child: Icon(
                                Icons.report_problem_outlined,
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'help center',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey.shade600),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 80,
                        width: 55,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 219, 231, 253),
                              maxRadius: 25,
                              child: Icon(
                                Icons.delivery_dining_outlined,
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'order food',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey.shade600),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 83,
                        width: 55,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 219, 231, 253),
                              maxRadius: 25,
                              child: Icon(
                                Icons.emoji_events_outlined,
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'popular events',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey.shade600),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          try {
                            launchUrl(
                                Uri.parse(
                                    "https://mujslcm.jaipur.manipal.edu:122/"),
                                mode: LaunchMode.externalApplication);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("Please try again:" + e.toString())));
                          }
                        },
                        child: Container(
                          height: 80,
                          width: 55,
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 219, 231, 253),
                                maxRadius: 25,
                                child: Icon(
                                  Icons.manage_accounts_sharp,
                                  size: 25,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'muj dms',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.grey.shade600),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 55,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 219, 231, 253),
                              maxRadius: 25,
                              child: Icon(
                                Icons.monetization_on_outlined,
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'sell items',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey.shade600),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Divider(
                  color: Colors.grey.shade300,
                  indent: 60,
                )),
                Text(
                  '   Featured For You   ',
                  style: TextStyle(color: Colors.grey.shade400),
                ),
                Expanded(
                    child: Divider(
                  color: Colors.grey.shade300,
                  endIndent: 60,
                ))
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(255, 214, 214, 214)
                          .withOpacity(0.5),
                      blurRadius: 10.0,
                      spreadRadius: 3)
                ],
              ),
              child: Image.asset('assets/dialog_promo.png'),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Crafted by FORTEK',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
