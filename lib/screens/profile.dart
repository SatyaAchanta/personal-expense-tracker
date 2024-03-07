import 'package:flutter/material.dart';

import '../common/cupertino/user_profile.dart';
import '../common/material/user_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  static final myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return GestureDetector(
      onTap: () => myFocusNode.unfocus(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: isIos
                ? MyCupertinoUserProfile()
                : const MyMaterialUserProfile(),
          ),
        ),
      ),
    );
  }
}
