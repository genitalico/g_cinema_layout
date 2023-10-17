import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:g_cinema_layout/btn_seat.dart';

void main() {
  testWidgets('BtnSeat toggle test person icon', (WidgetTester tester) async {
    final btnSeat = BtnSeat(
      seatNumber: 1,
      seatLetter: 'A',
      onTap: (String seatLetter, int seatNumber) {
        // verify if the seat number and letter are correct
        expect(seatNumber, 1);
        expect(seatLetter, 'A');
      },
    );

    // add widget to widget tree
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: btnSeat)));

    // verify if the widget is initially displayed with the seat number
    expect(find.text('1'), findsOneWidget);

    // tap the widget
    await tester.tap(find.byType(BtnSeat));
    await tester.pump();

    // verify if the icon is displayed after tapping the widget
    expect(find.byIcon(Icons.person), findsOneWidget);
  });

  testWidgets('BtnSeat toggle special seat', (WidgetTester tester) async {
    final btnSeat = BtnSeat(
      seatNumber: 1,
      seatLetter: 'A',
      isSpecialSeat: true,
      onTap: (String seatLetter, int seatNumber) {
        // verify if the seat number and letter are correct
        expect(seatNumber, 1);
        expect(seatLetter, 'A');
      },
    );

    // add widget to widget tree
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: btnSeat)));

    // verify if the widget is initially displayed special icon
    expect(find.byIcon(Icons.accessible_outlined), findsOneWidget);

    // tap the widget
    await tester.tap(find.byType(BtnSeat));
    await tester.pump();

    // verify if the icon is displayed after tapping the widget
    expect(find.byIcon(Icons.person), findsOneWidget);
  });

  testWidgets('BtnSeat blocked seat', (WidgetTester tester) async {
    final btnSeat = BtnSeat(
      seatNumber: 1,
      seatLetter: 'A',
      isBlocked: true,
      onTap: (String seatLetter, int seatNumber) {
        // verify if the seat number and letter are correct
        expect(seatNumber, 1);
        expect(seatLetter, 'A');
      },
    );

    // add widget to widget tree
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: btnSeat)));

    // verify if the widget is initially displayed special icon
    expect(find.byIcon(Icons.person), findsOneWidget);

    // tap the widget
    await tester.tap(find.byType(BtnSeat));
    await tester.pump();

    // verify if the icon is displayed after tapping the widget
    expect(find.byIcon(Icons.person), findsOneWidget);
  });
}
