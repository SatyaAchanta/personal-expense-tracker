import 'package:flutter/cupertino.dart';

class MyCupertinoButton extends StatelessWidget {
  const MyCupertinoButton({
    super.key,
    required this.onClickHandler,
    required this.title,
  });

  final Function onClickHandler;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text(title),
      onPressed: () {
        onClickHandler();
      },
    );
  }
}
