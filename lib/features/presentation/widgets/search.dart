import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  const SearchInput(
      {required this.textController, required this.hintText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: textController,
        onChanged: (value) {
          //Do something wi
        },
        decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.3),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70, width: 2.2),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 87, 183, 96), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
