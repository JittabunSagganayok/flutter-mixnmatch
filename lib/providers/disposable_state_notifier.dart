
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart_ext/rxdart_ext.dart';


class DisposableStateNotifier<T> extends StateNotifier<T> {

  final CompositeSubscription disposeBag = CompositeSubscription();

  DisposableStateNotifier(T state) : super(state);

  @override
  void dispose() {
    super.dispose();
    disposeBag.dispose();
  }

}