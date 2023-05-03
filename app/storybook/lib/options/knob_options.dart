import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'color_option.dart';
import 'typography_options.dart';

class KnobOption<T> {
  final String label;
  final T value;

  const KnobOption({required this.label, required this.value});

  static String labelFinder(KnobOption option) => option.label;
}

extension KnobOptionsExt on BuildContext {
  T legacyOption<T>({
    required String label,
    String? description,
    required List<KnobOption<T>> options,
  }) =>
      knobs
          .options<KnobOption<T>>(
            label: label,
            description: description,
            options: options,
            labelBuilder: KnobOption.labelFinder,
          )
          .value;

  List<KnobOption<DesignButtonStyle>> get buttonTypeOption => [
        KnobOption(label: 'primary', value: DesignButtonStyle.primary(this)),
        KnobOption(
            label: 'secondary', value: DesignButtonStyle.secondary(this)),
        KnobOption(label: 'outline', value: DesignButtonStyle.outline(this)),
        KnobOption(label: 'text', value: DesignButtonStyle.text(this)),
        KnobOption(label: 'danger', value: DesignButtonStyle.danger(this)),
      ];

  DesignButtonStyle get knobButtonStyleOption {
    return legacyOption(label: 'Button Type', options: buttonTypeOption);
  }

  List<KnobOption<int>> get colorIndex {
    final names = DesignTheme.of(this).valueListNames;
    return List<KnobOption<int>>.generate(
      names.length,
      (index) {
        return KnobOption(
          label: names[index],
          value: index,
        );
      },
    );
  }

  int get knobColorIndex {
    return legacyOption(
      label: 'color',
      options: colorIndex,
    );
  }

  Color get knobTextColorOption {
    return legacyOption(
      label: 'Text Color',
      options: textColorOption,
    );
  }

  FontWeight get knobFontWeightOption {
    return legacyOption(label: 'Font Weight', options: fontWeightOption);
  }

  FontStyle get knobFontStyleOption {
    return legacyOption(label: 'Font Style', options: fontStyleOption);
  }

  TextStyle? get knobTextStyleOption {
    return legacyOption(label: 'Text Style', options: const [
      KnobOption(label: 'default', value: null),
      KnobOption(label: 'h1', value: DesignTextStyle.h1),
      KnobOption(label: 'h2', value: DesignTextStyle.h2),
      KnobOption(label: 'h3', value: DesignTextStyle.h3),
      KnobOption(label: 'h4', value: DesignTextStyle.h4),
      KnobOption(label: 'h5', value: DesignTextStyle.h5),
      KnobOption(label: 'h6', value: DesignTextStyle.h6),
      KnobOption(label: 'body1', value: DesignTextStyle.body1),
      KnobOption(label: 'body2', value: DesignTextStyle.body2),
      KnobOption(label: 'caption', value: DesignTextStyle.caption),
    ]);
  }
}
