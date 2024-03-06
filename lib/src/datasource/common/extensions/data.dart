extension Fun<T> on T {
  K whenData<K>({required K Function() onDefault, K Function(T)? onData}) {
    return onData == null || this == null ? onDefault() : onData(this);
  }
}