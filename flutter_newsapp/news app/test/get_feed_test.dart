import 'package:flutter_test/flutter_test.dart';
import 'package:mytest/help/feed.dart';

void main() {
  test('Testing funntion for getting list of feed', () async {
    //ARRANGE
    Feed feed = Feed();

    //ACT
    feed.getFeed();

    //ASSERT
    expect(feed.feed.isNotEmpty, true);
  });
}
