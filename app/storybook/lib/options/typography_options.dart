import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

import 'knob_options.dart';

List<KnobOption<DesignText>> typographyKnobOption({FontWeight? fontWeight}) {
  final List<DesignText> typographys = DesignText.listTypography();
  return List<KnobOption<DesignText>>.generate(
    typographys.length,
    (index) {
      return KnobOption(
        label: typographys[index].text,
        value: typographys[index],
      );
    },
  );
}

List<KnobOption<FontWeight>> get fontWeightOption {
  final List<OFontWeight> fontWeight = OFontWeight.fontWeightList;
  return List<KnobOption<FontWeight>>.generate(
    fontWeight.length,
    (index) {
      return KnobOption(
        label: fontWeight[index].fontName,
        value: fontWeight[index].fontWeight,
      );
    },
  );
}

List<KnobOption<FontStyle>> get fontStyleOption {
  final List<OFontStyle> fontStyle = OFontStyle.fontStyleList;
  return List<KnobOption<FontStyle>>.generate(
    fontStyle.length,
    (index) {
      return KnobOption(
        label: fontStyle[index].styleName,
        value: fontStyle[index].fontStyle,
      );
    },
  );
}
