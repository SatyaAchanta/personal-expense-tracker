import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../controllers/expense_app_user.dart';
import '../../screens/categories.dart';
import '../../utils/text.dart';
import 'budget.dart';

class MyCupertinoUserProfile extends StatelessWidget {
  MyCupertinoUserProfile({super.key});

  final ExpenseAppUserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  userController.getUser().name,
                  style: MyTextStyles.labelMediumBold,
                ),
                Text(
                  userController.getUser().email,
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
            children: <Widget>[
              CupertinoListTile(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.01,
                ),
                title: const Text("Budget"),
                trailing: const CupertinoListTileChevron(),
                onTap: () {
                  Get.to(MyCupertinoUserBudget());
                },
              ),
              CupertinoListTile(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.01,
                ),
                title: const Text("Categories"),
                trailing: const CupertinoListTileChevron(),
                onTap: () => Get.to(UserCategories()),
              ),
              CupertinoListTile(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.01,
                ),
                title: Text("Developer"),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.01,
                ),
                title: Text("Feedback"),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.01,
                ),
                title: const Text("App Version"),
                trailing: const Text("1.0.0"),
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
