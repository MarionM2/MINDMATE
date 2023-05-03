import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helloworld/chat_pages/chat_firebase.dart';

void main() {
  testWidgets('ChatRoomPage sends and receives messages',
      (WidgetTester tester) async {
    // Build the ChatRoomPage widget.
    await tester.pumpWidget(MyChatPage());

    // Verify that the widget shows the correct initial text.
    expect(find.text('Anonymous Chat Room'), findsOneWidget);

    // Enter a message into the input field and tap the send button.
    await tester.enterText(find.byType(TextField), 'Hello world!');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();

    // Verify that the message is displayed in the chat.
    expect(find.text('Hello world!'), findsOneWidget);

    // Enter another message and tap send again.
    await tester.enterText(find.byType(TextField), 'How are you?');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();

    // Verify that both messages are displayed in the chat.
    expect(find.text('Hello world!'), findsOneWidget);
    expect(find.text('How are you?'), findsOneWidget);
  });
}
