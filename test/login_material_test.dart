import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_expense_tracker/common/material/login.dart';
import 'package:mockito/mockito.dart';
import './firebase_mock.dart';

class FirebaseService {
  Future<FirebaseApp> initializeApp() => Firebase.initializeApp();
}

class MockFirebaseService extends Mock implements FirebaseService {}

class MockFirebaseApp extends Mock implements FirebaseApp {}

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group("login screen tests", () {
    testWidgets('Login page has a title and a login button',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(home: MyMaterialLogin()));

      const titleKey = Key('loginTitle');
      const loginButtonKey = Key('loginButton');

      // Verify that our title is displayed.
      expect(find.byKey(titleKey), findsOneWidget);

      // Verify that our login button is displayed.
      expect(find.byKey(loginButtonKey), findsOneWidget);
    });

    testWidgets("NewUser checkbox enable should change login button text",
        (widgetTester) async {
      await widgetTester.pumpWidget(MaterialApp(home: MyMaterialLogin()));

      const loginButtonKey = Key('loginButton');
      const newUserCheckboxKey = Key('newUserCheckbox');

      // Verify that our login button is displayed.
      expect(find.byKey(loginButtonKey), findsOneWidget);

      // Verify that our newUser checkbox is displayed.
      expect(find.byKey(newUserCheckboxKey), findsOneWidget);

      // Tap on the newUser checkbox
      await widgetTester.tap(find.byKey(newUserCheckboxKey));
      await widgetTester.pump();

      // Verify that our login button text is changed.
      expect(find.text('I am new User. Register me.'), findsOneWidget);
    });
  });
}
