import 'package:shipcret/common/common_function.dart';
import 'package:shipcret/models/secret_feed_model.dart';
import 'package:shipcret/provider/state_provider.dart';
import 'package:shipcret/widgets/home/secret_feed_widget.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeSubPage extends ConsumerWidget {
  const HomeSubPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(secretFeedFutureProvider(0)).when(
      loading: () {
        return _body(isLoading: true);
      },
      error: (err, stack) {
        return _body(notCompletedText: "Error...");
      },
      data: (secretFeeds) {
        return _body(secretFeeds: secretFeeds);
      },
    );
  }

  Widget _body({List<FSecretFeedModel>? secretFeeds, bool isLoading = false, String notCompletedText = ""}) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constrains) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constrains.maxWidth,
              minHeight: constrains.maxHeight,
            ),
            child: secretFeeds != null
                ? _feedListView(secretFeeds)
                : _emptyView(context: context, isLoading: isLoading, text: notCompletedText),
          );
        },
      ),
    );
  }

  Container _emptyView({
    required BuildContext context,
    required isLoading,
    required String text,
  }) {
    return Container(
      color: ownerColorScheme(context).primaryContainer.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          isLoading ? const CircularProgressIndicator() : Text(text),
        ],
      ),
    );
  }

  CustomScrollView _feedListView(List<FSecretFeedModel> secretFeeds) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return FSecretFeedWidget(
                secretFeedModel: secretFeeds[index],
              );
            },
            childCount: secretFeeds.length,
          ),
        ),
      ],
    );
  }
}
