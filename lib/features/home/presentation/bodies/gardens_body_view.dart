import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../garden/domain/garden_db.dart';
import '../../../garden/presentation/garden_summary_view.dart';
import '../../../user/domain/user_db.dart';

/// Displays a list of Gardens.
class GardensBodyView extends ConsumerWidget {
  const GardensBodyView({
    super.key,
  });

  final String title = 'Gardens';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GardenDB gardenDB = ref.watch(gardenDBProvider);
    final String currentUserID = ref.watch(currentUserIDProvider);
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
            children: gardenDB
                .getAssociatedGardenIDs(userID: currentUserID)
                .map((gardenID) => GardenSummaryView(gardenID: gardenID))
                .toList()
                .toList()));
  }
}