import 'package:shipcret/common/widgets/background_image_widget.dart';
import 'package:shipcret/material-theme/common_color.dart';
import 'package:shipcret/models/secret_feed_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipcret/widgets/home/count_down_text_widget.dart';

class FFeedWidgetView extends ConsumerWidget {
  final List<FSecretFeedModel> userFeedModels;

  const FFeedWidgetView(this.userFeedModels, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _feedListView(userFeedModels, context: context);
  }

  Widget _feedListView(
    List<FSecretFeedModel> secretFeeds, {
    required BuildContext context,
  }) {
    final secretProfileModels = FSecretFeedModel.generateRandomData();

    List<FSecretFeedModel> secretFeedModels = [];
    for (var element in secretProfileModels) {
      secretFeedModels.add(FSecretFeedModel.fromJson(element));
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: secretFeedModels.length,
      itemBuilder: (context, index) {
        return _feedCard(
          context: context,
          secretFeedModel: secretFeedModels[index],
        );
      },
    );
  }

  Widget _feedCard({
    required BuildContext context,
    required FSecretFeedModel secretFeedModel,
  }) {
    return Container(
        // alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FBackgroundStackBlurWidget(
            // FBackgroundImageWidget(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 80,
            image: AssetImage(secretFeedModel.profileImageUrl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 1.0),
                  decoration: BoxDecoration(
                    color: FCommonColor.godicOpacity(0.4),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: FCountDownTextWidget(
                    expiredDateTime: secretFeedModel.expiredDateTime,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

// Widget _feedListView(
//     List<FSecretFeedModel> secretFeeds, {
//     required BuildContext context,
//   }) {
//     final secretProfileModels = FSecretFeedModel.generateRandomData();

//     List<FSecretFeedModel> secretFeedModels = [];
//     for (var element in secretProfileModels) {
//       secretFeedModels.add(FSecretFeedModel.fromJson(element));
//     }

//     return ListView.builder(
//       physics: const BouncingScrollPhysics(),
//       itemCount: secretFeedModels.length,
//       itemBuilder: (context, index) {
//         if (index % 2 == 0) {
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               _feedCard(
//                 context: context,
//                 secretFeedModel: secretFeedModels[index],
//               ),
//             ],
//           );
//         } else {
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               _feedCard(
//                 context: context,
//                 secretFeedModel: secretFeedModels[index],
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }