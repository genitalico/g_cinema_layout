import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:g_cinema_layout/btn_seat.dart';
import 'package:g_cinema_layout/row_seats.dart';

void main() {
  testWidgets('Row seats 3 rows', (WidgetTester tester) async {
    final rowSeats = RowSeats(
      totalSeats: 3,
      seatLetter: 'A',
      specialSeats: const [2],
      blockSeats: const [3],
      onTap: (String seatLetter, int seatNumber) {
        expect(seatNumber, 2);
        expect(seatLetter, 'A');
      },
    );

    await tester.pumpWidget(MaterialApp(home: Scaffold(body: rowSeats)));

    expect(find.byType(BtnSeat), findsNWidgets(3));

    expect(find.text('1'), findsOneWidget);

    final specialSeatIcon =
        find.widgetWithIcon(BtnSeat, Icons.accessible_outlined);
    expect(specialSeatIcon, findsOneWidget);

    await tester.tap(find.byType(BtnSeat).at(1));
    await tester.pump();
    final blockedSeatIcon = find.widgetWithIcon(BtnSeat, Icons.person);
    expect(blockedSeatIcon, findsNWidgets(2));

    final btnSeatFinder = find.byType(BtnSeat).first;
    final btnSeat = tester.widget<BtnSeat>(btnSeatFinder);
    expect(btnSeat.color, Colors.blue);
  });
}
