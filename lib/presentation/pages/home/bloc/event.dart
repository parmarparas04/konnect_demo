import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  final String assetPath;
  const HomeEvent({required this.assetPath});

  @override
  List<Object> get props => [assetPath];

  //,context];

  @override
  String toString() {
    return 'HomeEvent{ assetPath}';
  }
}
