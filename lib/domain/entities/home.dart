import 'package:equatable/equatable.dart';

class HomeData extends Equatable {
  final String? title;
  final String? subtitle;
  final String? icon;

  const HomeData({this.title, this.subtitle, this.icon});

  @override
  List<Object?> get props {
    return [title, subtitle, icon];
  }
}
