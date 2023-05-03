import 'package:ait_flutter_template/themes/design_theme_extended.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:widgetbook/widgetbook.dart';

import 'auth/auth_category.dart';

final devices = [
  Apple.iPhone11,
  Apple.iPhone12,
  const Device.special(
    name: 'Test',
    resolution: Resolution(
      nativeSize: DeviceSize(width: 400, height: 400),
      scaleFactor: 1,
    ),
  ),
];

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: [
        AuthCategory(context),
      ],
      addons: [
        ...configureMaterialAddons(
          themeSetting: MaterialThemeSetting.firstAsSelected(
            themes: [
              WidgetbookTheme(
                name: 'Light',
                data: DesignThemeExtended.lightTheme(fontFamily: 'Satoshi'),
              ),
              WidgetbookTheme(
                name: 'Dark',
                data: DesignThemeExtended.darkTheme(fontFamily: 'Satoshi'),
              ),
            ],
          ),
          frameSetting: FrameSetting.firstAsSelected(frames: [
            DefaultDeviceFrame(
              setting: DeviceSetting.firstAsSelected(devices: devices),
            ),
            NoFrame(),
            WidgetbookFrame(
              setting: DeviceSetting.firstAsSelected(devices: devices),
            )
          ]),
          textScaleSetting: TextScaleSetting.firstAsSelected(
            textScales: [
              1,
              2,
              3,
            ],
          ),
          localizationSetting: LocalizationSetting(
            activeLocale: const Locale('en', 'US'),
            localizationsDelegates: [
              SharedStr.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locales: SharedStr.delegate.supportedLocales,
          ),
        ),
      ],
    );
  }
}
