import 'package:flutter/cupertino.dart';
import 'package:personal_expense_tracker/utils/text.dart';

class MyCupertinoUserProfile extends StatelessWidget {
  const MyCupertinoUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          width: screenSize.width / 5,
          height: screenSize.height / 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                "https://i.pinimg.com/280x280_RS/88/67/97/88679790dc509730e92c97f8f9f5189e.jpg",
              ),
            ),
          ),
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height / 50,
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(
              vertical: screenSize.height / 50,
            ),
            decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              borderRadius: BorderRadius.circular(10),
              border: null,
            ),
            child: Column(
              children: [
                Text(
                  "Satya Achanta",
                  style: MyTextStyles.labelMediumBold,
                ),
                Text(
                  "satya-flutter@flutter.com",
                  style: MyTextStyles.labelSmall,
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.01,
          ),
          width: screenSize.width,
          child: CupertinoListSection.insetGrouped(
            backgroundColor:
                CupertinoColors.systemBackground.resolveFrom(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: null,
            ),
            children: const <Widget>[
              CupertinoListTile(
                title: Text("Budget"),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                title: Text("Categories"),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                title: Text("Developer"),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                title: Text("Feedback"),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                title: Text("App Version"),
                trailing: Text("1.0.0"),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.01,
            ),
            width: screenSize.width * 0.8,
            child: CupertinoButton(
              color: CupertinoColors.systemRed,
              child: Text(
                "Logout",
                style: MyTextStyles.labelLargeBold,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
