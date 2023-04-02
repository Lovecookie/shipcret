import 'package:shipcret/common/common_font.dart';
import 'package:shipcret/common/common_ui_overlay_style.dart';
import 'package:shipcret/material-theme/common_color.dart';
import 'package:shipcret/providers/auth/auth_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipcret/widgets/common/common_string.dart';

enum EWelcomePageState {
  loading,
  error,
  data,
}

class FWelcomeUserPage extends ConsumerStatefulWidget {
  const FWelcomeUserPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FWelcomeUserPageState();
}

class _FWelcomeUserPageState extends ConsumerState<FWelcomeUserPage> {
  @override
  Widget build(BuildContext context) {
    FCommonUIOverlayStyle.topStateBar(color: FCommonColor.godic);
    return ref.watch(authSignInProvider).when(
      loading: () {
        return _body(context, state: EWelcomePageState.loading);
      },
      error: (err, stack) {
        return _body(context, state: EWelcomePageState.error, text: "Error...");
      },
      data: (userInfoDto) {
        ref.read(authServiceProvider).loginSuccess(
              name: userInfoDto.name,
              email: userInfoDto.email,
            );

        return _body(context, state: EWelcomePageState.data, text: userInfoDto.name);
      },
    );
  }

  Widget _body(
    BuildContext context, {
    required EWelcomePageState state,
    String text = "",
  }) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) {
        return Container(
          color: FCommonColor.godic,
          constraints: BoxConstraints(
            minWidth: constrains.maxWidth,
            minHeight: constrains.maxHeight,
          ),
          child: _emptyView(context: context, state: state, text: text),
        );
      },
    );
  }

  Container _emptyView({
    required BuildContext context,
    required EWelcomePageState state,
    required String text,
  }) {
    return Container(
      color: FCommonColor.godic,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _pageByState(state, text),
        ],
      ),
    );
  }

  Widget _pageByState(EWelcomePageState state, String text) {
    switch (state) {
      case EWelcomePageState.loading:
        return const CircularProgressIndicator();
      case EWelcomePageState.error:
        return Text(
          text,
          style: const TextStyle(
            color: FCommonColor.subPrimaryWhite,
            fontSize: 30,
            fontFamily: FCommonFont.family,
          ),
        );
      case EWelcomePageState.data:
        return Text(
          FCommonString.welcome(text),
          style: const TextStyle(
            color: FCommonColor.subPrimaryWhite,
            fontSize: 30,
            fontFamily: FCommonFont.family,
          ),
        );
    }
  }
}