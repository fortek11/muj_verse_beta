import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../state/menu_carpool_state.dart';
import '../widgets/menu_badge.dart';
import '../widgets/menu_section.dart';

class OutletDetailMenu extends StatelessWidget {
  static const routeName = 'detailmenu';
  const OutletDetailMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final outletName = ModalRoute.of(context)!.settings.arguments as String;
    final menuState = Provider.of<DataState>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 234),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1F21),
        foregroundColor: const Color.fromARGB(255, 208, 210, 226),
      ),
      body: FutureBuilder(
          future: menuState.getMenuDetails(outletName),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final restaurantData = snapshot.data;
              final Map<String, dynamic> restautantMenuData =
                  restaurantData!['menu'];
              final menuSectionsTitleList = restautantMenuData.keys.toList();
              final menuSectionsLenght = menuSectionsTitleList.length;
              final menuSectionsDetailList = restautantMenuData.values.toList();
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          color: Color(0xFF1E1F21),
                          child: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(25),
                                        bottomRight: Radius.circular(25)),
                                    color: Color(0xFF1E1F21)),
                                height: 100,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25)),
                                    color: Color.fromARGB(255, 230, 230, 234)),
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                            left: 20,
                            right: 20,
                            top: 0,
                            child: CircleAvatar(
                              maxRadius: 100,
                              minRadius: 100,
                              backgroundImage: AssetImage(
                                'assets/cover-93.jpg',
                              ),
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            outletName,
                            style: const TextStyle(
                                color: Color(0xFF1D2228),
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Column(
                            children: [
                              Text(
                                restaurantData['description'] ?? '',
                                style: const TextStyle(
                                    color: Color(0xFFB0B2C0), fontSize: 15),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  MenuBadge(
                                    title:
                                        restaurantData['time'].toString() ?? '',
                                    image: 'assets/clock.png',
                                  ),
                                  MenuBadge(
                                    title:
                                        restaurantData['star'].toString() ?? '',
                                    image: 'assets/star.png',
                                  ),
                                  MenuBadge(
                                    title:
                                        restaurantData['location'].toString() ??
                                            '',
                                    image: 'assets/location.png',
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: menuSectionsLenght,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Card(
                                  elevation: 2,
                                  surfaceTintColor: Colors.transparent,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.only(
                                              left: 20,
                                              right: 15,
                                              bottom: 0,
                                              top: 20),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              menuSectionsTitleList[index],
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      const Divider(
                                        color: Colors.black,
                                        endIndent: 15,
                                        indent: 15,
                                        thickness: 1.5,
                                      ),
                                      Container(
                                          margin: const EdgeInsets.only(
                                              left: 5, right: 5, bottom: 10),
                                          child: MenuSection(
                                              menuSectionsDetailList[index]))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color(0xFF1D2228),
              ));
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 05,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        splashColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 175, 200, 232),
        foregroundColor: const Color.fromARGB(186, 0, 0, 0),
        onPressed: () {},
        child: Icon(Icons.phone),
      ),
    );
  }
}
