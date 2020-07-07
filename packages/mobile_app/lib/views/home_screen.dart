import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/prophecy.dart';
import '../widgets/prophecy_record_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropheciesBloc, ProphecyState>(
        builder: (context, state) {
      if (state is ProphecyLoadInProgressState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is PropheciesLoadSuccessState) {
        if (state.prophecies.isEmpty) {
          return Center(child: Text("Empty"));
        } else
          return Scaffold(
            body: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ProphecyRecordWidget(prophecy: state.prophecies[index]);
              },
              itemCount: state.prophecies.length,
            ),
          );
      } else {
        // state is ProphecyLoadFailureState
        return Center(
          child: Text("Failure loading"),
        );
      }
    });
  }
}
