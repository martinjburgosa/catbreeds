import 'dart:async';

export 'dart:async';

abstract class CompleterFactory<T> {
  factory CompleterFactory() => _CompleteFactoryImp<T>();
  Completer<T> create();
}

class _CompleteFactoryImp<T> implements CompleterFactory<T> {
  @override
  Completer<T> create() => Completer<T>();
}