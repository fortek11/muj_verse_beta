import 'package:flutter/material.dart';

class OlxItemDetailScreen extends StatelessWidget {
  final Map<dynamic, dynamic> productData;
  OlxItemDetailScreen(this.productData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  InkWell(
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                productData['image'],
                              ))),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 340,
                  )
                ],
              ),
              Positioned(
                top: 30,
                left: 12,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor:
                        Color.fromARGB(255, 17, 29, 54).withOpacity(0.7),
                    foregroundColor: Colors.white,
                    maxRadius: 18,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 22,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 250,
                left: 30,
                right: 30,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(48, 139, 139, 139)
                              .withOpacity(0.5),
                          blurRadius: 10.0,
                          spreadRadius: 1)
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                        leading: ClipOval(
                            child: Image.asset(
                          "assets/darshan.jpg",
                          fit: BoxFit.cover,
                          width: 45.0,
                          height: 45.0,
                        )),
                        title: Text('Darshan Wadhva'),
                        subtitle: Text('Posted on 23 Dec'),
                        trailing: IconButton(
                            onPressed: () {}, icon: Icon(Icons.error)),
                      ),
                      Divider(
                        height: 0,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '₹',
                          style: TextStyle(
                            color: Color.fromARGB(255, 65, 93, 133),
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                          children: [
                            TextSpan(
                              text: productData['price'],
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 27,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        productData['title'],
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade700),
                      ),
                      Divider(
                        height: 20,
                        color: Colors.grey.shade300,
                      ),
                      Text(productData['description']),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
      floatingActionButton: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(235, 37, 43, 49),
                Color(0xFF1D2228),
                Color.fromARGB(235, 37, 43, 49),
              ],
              stops: [
                0.2,
                0.7,
                1
              ]),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: 100,
                child: Icon(
                  Icons.call,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
            VerticalDivider(
              width: 0,
              color: Colors.white.withOpacity(0.3),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 100,
                child: Icon(
                  Icons.message_outlined,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
