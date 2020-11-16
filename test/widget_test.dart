// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_stateful/main.dart';

void main() {
  Finder findByAssetImage(String path) {
    final finder = find.byWidgetPredicate((Widget widget) {
      if (widget is Image && widget.image is AssetImage) {
        final assetImage = widget.image as AssetImage;
        return assetImage.keyName == path;
      }
      return false;
    });
    return finder;
  }

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('中年男性の状態変化回数：0'), findsOneWidget);
    expect(find.text('中年男性の状態変化回数：1'), findsNothing);
    expect(findByAssetImage('assets/fat.PNG'), findsOneWidget);
    expect(find.text('ダイエットする'), findsOneWidget);
    await tester.tap(find.text('ダイエットする'));
    await tester.pump();

    expect(find.text('中年男性の状態変化回数：0'), findsNothing);
    expect(find.text('中年男性の状態変化回数：1'), findsOneWidget);
    expect(find.text('リバウンドする'), findsOneWidget);
    expect(find.text('中年男性の状態変化回数：1'), findsOneWidget);
    expect(findByAssetImage('assets/slim.PNG'), findsOneWidget);
  });
}
