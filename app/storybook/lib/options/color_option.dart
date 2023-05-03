import 'package:flutter/material.dart';

import 'knob_options.dart';

List<KnobOption<Color>> get textColorOption {
  List<String> itemName = ['black', 'white'];
  List<Color> items = [Colors.black, Colors.white];
  //for (var element in DesignColors.colorList) {
  //  if (element != DesignColors.black && element != DesignColors.white) {
  //    items.add(element);
  //  }
  //}
  return List<KnobOption<Color>>.generate(
    items.length,
    (index) {
      return KnobOption(
        label: itemName[index],
        value: items[index],
      );
    },
  );
}
