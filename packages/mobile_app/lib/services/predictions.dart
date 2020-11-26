import 'package:flutter/material.dart';
import 'package:predictions/predictions.dart';

class PredictionsFlutterMobile extends DefaultPredictions {
  String _locale;
  String get locale => _locale;
  bool isPrepared;

  /// constructor
  PredictionsFlutterMobile(String locale) {
    isPrepared = false;
    getPredictionAlgorithm = GetPredictionByDate();
    dataManipulation["add_csv"] = SingleCsvAdd();
    _locale = locale;
  }

  Future changeLocale(String locale) async {
    isPrepared = false;
    _locale = locale;
    await this.prepare();
  }

  Future prepare() async {
    /// @TODO
    /// we read every file in respective assets folder
    /// and run the job by label "add_csv" for its contents

    //
    isPrepared = true;
  }
}
