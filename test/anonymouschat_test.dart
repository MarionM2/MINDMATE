import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helloworld/chat_pages/anonymouschat.dart';
import 'package:helloworld/home.dart';
import 'package:helloworld/chat_pages/chat_firebase.dart';
import 'package:helloworld/main.dart';

void main() {
  testWidgets('JoinChatPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: JoinChatPage(),
      ),
    );

    // Expect the title text widget to be present
    expect(find.text('Join Anonymous Chat Group'), findsOneWidget);

    // Expect the welcome text widget to be present
    expect(
        find.text(
            'Welcome to the anonymous chat group where users on the platform can share experience without showing their identity. Any Abuse on this space won\'t be allowed and user will be removed if they abuse anyone.'),
        findsOneWidget);

    // Expect the "Do you want to join the anonymous chat group?" text widget to be present
    expect(find.text('Do you want to join the anonymous chat group?'),
        findsOneWidget);

    // Expect the "Yes" button to be present
    expect(find.widgetWithText(ElevatedButton, 'Yes'), findsOneWidget);

    // Expect the "No" button to be present
    expect(find.widgetWithText(OutlinedButton, 'No'), findsOneWidget);
  });

//   testWidgets('JoinChatPage Button Press Test', (WidgetTester tester) async {
//     await tester.pumpWidget(
//       MaterialApp(
//         home: JoinChatPage(),
//       ),
//     );

//     // Tap the "Yes" button
//     await tester.tap(find.widgetWithText(ElevatedButton, 'Yes'));
//     await tester.pumpAndSettle();

//     // Expect that the ChatScreen page is pushed to the navigator
//     expect(find.byType(ChatScreen), findsOneWidget);

//     // Tap the "No" button
//     await tester.tap(find.widgetWithText(OutlinedButton, 'No'));
//     await tester.pumpAndSettle();

//     // Expect that the HomePage page is pushed to the navigator
//     expect(find.byType(HomePage), findsOneWidget);
//   });
}
