import 'package:flutter/material.dart';

import '../../../sample/presentation/sample_item.dart';
import '../../../sample/presentation/sample_item_details_view.dart';

/// Displays a list of Gardens.
class ChapterBodyView extends StatelessWidget {
  const ChapterBodyView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });
  final List<SampleItem> items;
  final String title = 'Chapter';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text('SampleItem ${item.id}'),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  SampleItemDetailsView.routeName,
                );
              });
        });
  }
}
