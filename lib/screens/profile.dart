import 'package:flutter/cupertino.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  static final myFocusNode = FocusNode();

  final TextEditingController _budgetController =
      TextEditingController(text: "1500");

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => myFocusNode.unfocus(),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
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
                child: const Text(
                  "Satya Achanta",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.01,
                ),
                width: screenSize.width,
                child: CupertinoListSection.insetGrouped(
                  backgroundColor: CupertinoColors.systemBackground,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: null,
                  ),
                  header: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text("Budget Settings"),
                    ),
                  ),
                  children: <Widget>[
                    CupertinoListTile(
                      title: const Text("Budget"),
                      trailing: SizedBox(
                        width: screenSize.width / 5,
                        child: CupertinoTextField(
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemBackground
                                .resolveFrom(context),
                          ),
                          controller: _budgetController,
                          keyboardType: TextInputType.number,
                          placeholder: "Enter Budget",
                          focusNode: myFocusNode,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                    const CupertinoListTile(
                      title: Text("Currency"),
                      trailing: CupertinoListTileChevron(),
                    ),
                    const CupertinoListTile(
                      title: Text("Categories"),
                      trailing: CupertinoListTileChevron(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.01,
                ),
                width: screenSize.width,
                child: CupertinoListSection.insetGrouped(
                  backgroundColor: CupertinoColors.systemBackground,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: null,
                  ),
                  header: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text("About us"),
                    ),
                  ),
                  children: const <Widget>[
                    CupertinoListTile(
                      title: Text("Developer"),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile(
                      title: Text("Feedback"),
                      trailing: CupertinoListTileChevron(),
                    ),
                    CupertinoListTile(
                      title: Text("App Versions"),
                      trailing: Text("1.0.0"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
