import 'package:flutter/material.dart';

class OlxCategoryWidget extends StatelessWidget {
  @override
  final Map<String, String> _categories = {
    'Thrift': 'assets/olx/jacket.png',
    'Electronics': 'assets/olx/responsive.png',
    'Accessories': 'assets/olx/bracelet.png',
    'Footwear': 'assets/olx/sneakers.png',
    'Books/Notes': 'assets/olx/open-book.png',
    'Posters': 'assets/olx/poster.png',
    'Stationary': 'assets/olx/calculator.png',
    'Other': 'assets/olx/more-information.png',
  };
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 7, left: 7, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300.withOpacity(0.55),
                      blurRadius: 10.0,
                      spreadRadius: 2)
                ],
              ),
              width: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    _categories.entries.elementAt(index).value,
                    color: Color.fromARGB(255, 38, 52, 71),
                    height: 35,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  FittedBox(
                    child: Text(
                      _categories.entries.elementAt(index).key,
                      style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 0.5,
                          color: const Color.fromARGB(255, 41, 51, 65)),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
