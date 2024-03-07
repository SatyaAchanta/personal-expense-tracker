import 'package:flutter/material.dart';

class MyMaterialUserProfile extends StatelessWidget {
  const MyMaterialUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height / 20,
          ),
          width: screenSize.width * 0.25,
          height: screenSize.height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                "https://i.pinimg.com/280x280_RS/88/67/97/88679790dc509730e92c97f8f9f5189e.jpg",
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.005,
          ),
          child: Text(
            "Satya Achanta",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
