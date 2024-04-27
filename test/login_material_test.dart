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

  testWidgets('Login page has a title and a login button',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: MyMaterialLogin()));

    const titleKey = Key('loginTitle');
    const loginButtonKey = Key('loginButton');
    const emailFieldKey = Key('emailField');
    const passwordFieldKey = Key('passwordField');

    await tester.enterText(
      find.byKey(emailFieldKey),
      'widget-tests@gmail.com',
    );
    await tester.enterText(
      find.byKey(passwordFieldKey),
      'widget-tests@gmail.com',
    );

    // Verify that our title is displayed.
    expect(find.byKey(titleKey), findsOneWidget);

    // Verify that our login button is displayed.
    expect(find.byKey(loginButtonKey), findsOneWidget);
  });
}
