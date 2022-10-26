import 'package:flutter/material.dart';
import 'package:psikolook_anasayfa/core/base/state/base_state.dart';
import 'package:psikolook_anasayfa/core/base/widget/base_widget.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      onPageBuilder: (context, value) => Text("data"),
      onDispose: () {},
      onModelRady: (model) {},
    );
  }
}
