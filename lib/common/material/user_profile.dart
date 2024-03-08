import 'package:flutter/material.dart';

class MyMaterialUserProfile extends StatelessWidget {
  MyMaterialUserProfile({super.key});

  final TextEditingController budgetController = TextEditingController();
  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    budgetController.text = "1500";
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
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: screenSize.height * 0.05,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.01,
            horizontal: screenSize.width * 0.01,
          ),
          child: ListTile(
              title: Text(
                'Budget',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Text(
                '1500',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.edit_square,
                  size: screenSize.width * 0.05,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(
                        'Enter your budget',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: TextField(
                        controller: feedbackController,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textInputAction: TextInputAction.done,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: Text(
                            'Cancel',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        TextButton(
                          onPressed: () => {
                            print(feedbackController.text),
                            Navigator.pop(context, 'OK'),
                          },
                          child: Text('OK',
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                      ],
                    ),
                  );
                },
              )),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.01,
            horizontal: screenSize.width * 0.01,
          ),
          child: ListTile(
            title: Text(
              'Categories',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Text(
              '6',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_right,
                size: screenSize.width * 0.05,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                budgetController.text = budgetController.text;
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.01,
            horizontal: screenSize.width * 0.01,
          ),
          child: ListTile(
            title: Text(
              'Currency',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Text(
              'USD',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_right,
                size: screenSize.width * 0.05,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                budgetController.text = budgetController.text;
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.01,
            horizontal: screenSize.width * 0.01,
          ),
          child: ListTile(
            title: Text(
              'Feedback for Developer',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Container(
              margin: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.01,
              ),
              child: TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                textInputAction: TextInputAction.send,
                decoration: InputDecoration(
                  hintText: "Enter your feedback here",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                ),
                maxLines: 4,
                onSubmitted: (val) => {
                  print("feedback is----"),
                  print(val),
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
