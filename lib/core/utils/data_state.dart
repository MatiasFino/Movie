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

enum EndPoint {
  POPULAR,
  TOP_RATED,
  UPCOMING,
  NOW_PLAYING,
}

extension EndPointExtension on EndPoint {
  String get stringValue {
    switch (this) {
      case EndPoint.POPULAR:
        return 'popular';
      case EndPoint.TOP_RATED:
        return 'top_rated';
      case EndPoint.UPCOMING:
        return 'upcoming';
      case EndPoint.NOW_PLAYING:
        return 'now_playing';
    }
  }

  static EndPoint fromString(String value) {
    switch (value) {
      case 'popular':
        return EndPoint.POPULAR;
      case 'top_rated':
        return EndPoint.TOP_RATED;
      case 'upcoming':
        return EndPoint.UPCOMING;
      case 'now_playing':
        return EndPoint.NOW_PLAYING;
      default:
        throw ArgumentError('Invalid value: $value');
    }
  }
}
