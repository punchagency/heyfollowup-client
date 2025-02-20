import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hey_follow_up/screens/create_follow_up/model/next_step_model.dart';

import '../../../util/color_scheme.dart';

class NextStepListWidget<T> extends StatelessWidget {
  final Function(T) onItemSelected;
  final List<T> list;

  const NextStepListWidget(
      {super.key, required this.onItemSelected, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        T model = list[index];
        return InkWell(
          onTap: (){
            onItemSelected(model);
            Navigator.of(context).pop();
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.kFormBorderColor,
                ),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            child: Text((model as NextStepModel).title),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 10,
        );
      },
      itemCount: list.length,
    );
  }
}
