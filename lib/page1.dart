import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_Tadas_Petra/providers.dart';

class Page1 extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final text = useProvider(textProvider);
    final future = useProvider(futureProvider);
    final stream = useProvider(streamProvider);
    final state = useProvider(stateProvider);

    // state notifier (can be done in two ways)
    final int stateNotifierState = useProvider(stateNotifierProvider.state);
    final stateNotifier = useProvider(stateNotifierProvider);

    // change notifier
    final changeNotifier = useProvider(changeNotifierProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Text Provider : " + text),
            SizedBox(
              height: 20,
            ),
            future.when(
                data: (config) {
                  return Text('Future Provider : ' + config.toString());
                },
                loading: () => CircularProgressIndicator(),
                error: (err, stack) => Text("Errorrr")),
            SizedBox(
              height: 20,
            ),
            stream.when(
                data: (config) {
                  return Text('Stream Provider : ' + config.toString());
                },
                loading: () => CircularProgressIndicator(),
                error: (err, stack) => Text("Errorrr")),
            SizedBox(
              height: 20,
            ),
            Text("State Provider : " + state.state.toString()),
            SizedBox(
              height: 20,
            ),
            Text("StateNotifier Provider : " + stateNotifierState.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () {
                    context.read(stateNotifierProvider).add();
                  },
                  child: Text('add'),
                ),
                RaisedButton(
                  onPressed: () {
                    stateNotifier.subtract();
                  },
                  child: Text('subtract'),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("ChangeNotifier Provider : " +
                changeNotifier.number.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () {
                    changeNotifier.add();
                  },
                  child: Text('add'),
                ),
                RaisedButton(
                  onPressed: () {
                    changeNotifier.subtract();
                  },
                  child: Text('subtract'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          state.state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
