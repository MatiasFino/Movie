class Failure {
  final int code;
  final String message;

  Failure(
    this.code,
    this.message,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Failure &&
              other.code == this.code &&
              other.message == this.message;

  @override
  int get hashCode => code.hashCode ^ message.hashCode;
}

enum EndPoint {
  POPULAR,
  TOP_RATED,
  UPCOMING,
  NOW_PLAYING,
}

enum ResponseStatus {
  DATA,
  ERROR,
}

class DataState<T> {
  final ResponseStatus state;
  final T? data;
  final Failure? failure;

  const DataState({
    required this.state,
    this.data = null,
    this.failure = null,
  }) : assert(data != null || failure != null);
}

class SuccessState<T> extends DataState<T> {
  SuccessState({
    required super.state,
    required super.data,
  });
}

class FailureState<T> extends DataState<T> {
  FailureState({
    required super.state,
    required super.failure,
  });
}
