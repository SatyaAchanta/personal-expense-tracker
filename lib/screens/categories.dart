import 'package:flutter/material.dart';

import '../common/cupertino/user_categories.dart';
import '../common/material/user_categories.dart';

class UserCategories extends StatelessWidget {
  const UserCategories({super.key});

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return isIOS ? MyCupertinoUserCategories() : MyMaterialUserCategories();
  }
}
