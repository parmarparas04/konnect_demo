import 'package:equatable/equatable.dart';

class FeedListEvent extends Equatable {
  final String assetPath;
  const FeedListEvent({required this.assetPath});

  @override
  List<Object> get props => [assetPath];

  //,context];

  @override
  String toString() {
    return 'FeedListEvent{ assetPath}';
  }
}
