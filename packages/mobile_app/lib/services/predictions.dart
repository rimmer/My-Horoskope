import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:predictions/predictions.dart';

/// @TODO BLoC
class PredictionsFlutterMobile extends DefaultPredictions {
  String _locale;
  String get locale => _locale;
  bool isPrepared;

  /// constructor
  PredictionsFlutterMobile(String locale) {
    isPrepared = false;
    getPredictionAlgorithm = GetPredictionByDate();
    dataManipulation["add_csv"] = SingleCsvAdd();
    dataManipulation["clear"] = Clear();
    _locale = locale;
  }

  Future changeLocale(String locale) async {
    isPrepared = false;
    _locale = locale;
    await this.job("clear", null);
  }

  Future prepare(BuildContext context) async {
    //

    /// read all file names in needed assets folder
    final String manifestJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    List<String> files = json.decode(manifestJson).keys.where((String key) {
      return key.startsWith('assets/data/predictions/$_locale/');
    }).toList();

    /// read every file by correct asset file name
    String rawData;
    for (String file in files) {
      rawData = await rootBundle.loadString(file);

      /// use add_csv job for every readed file
      await this.job("add_csv", rawData);
    }

    //
    isPrepared = true;
  }
}
