import 'package:flutter/material.dart';
import 'package:kafil_test/helper/app_colors.dart';

class NumberStepper extends StatelessWidget {
  final double width;
  final int totalSteps;
  final int curStep;
  final Color stepColor;
  final double lineWidth;

  const NumberStepper({
    Key? key,
    required this.width,
    required this.curStep,
    required this.stepColor,
    required this.totalSteps,
    required this.lineWidth,
  })  : assert(curStep > 0 == true && curStep <= totalSteps + 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 24.0,
        right: 24.0,
      ),
      width: width,
      child: Row(
        children: _steps(),
      ),
    );
  }

  List<Widget> _steps() {
    var list = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      //colors according to state

      var circleColor = getCircleColor(i);
      var borderColor = getBorderColor(i);
      var lineColor = getLineColor(i);

      // step circles
      list.add(
        Container(
          width: 28.0,
          height: 28.0,
          decoration: BoxDecoration(
            color: circleColor,
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            border: Border.all(
              color: borderColor,
              width: 1.0,
            ),
          ),
          child: getInnerElementOfStepper(i),
        ),
      );
      //line between step circles
      if (i != totalSteps - 1) {
        list.add(
          Expanded(
            child: Container(
              height: lineWidth,
              color: lineColor,
            ),
          ),
        );
      }
    }
    return list;
  }

  Widget getInnerElementOfStepper(index) {
    if (index + 1 < curStep) {
      return const Icon(
        Icons.check,
        color: Colors.white,
        size: 16.0,
      );
    } else if (index + 1 == curStep) {
      return Center(
        child: Text(
          '$curStep',
          style: TextStyle(
            color: stepColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  getCircleColor(i) {
    final Color color;
    if (i + 1 < curStep) {
      color = stepColor;
    } else if (i + 1 == curStep) {
      color = Colors.white;
    } else {
      color = Colors.white;
    }
    return color;
  }

  getBorderColor(i) {
    final Color color;
    if (i + 1 < curStep) {
      color = stepColor;
    } else if (i + 1 == curStep) {
      color = stepColor;
    } else {
      color = AppColors.whitGrey;
    }

    return color;
  }

  getLineColor(i) {
    var color =
        curStep > i + 1 ? Colors.blue.withOpacity(0.4) : Colors.grey[200];
    return color;
  }
}
