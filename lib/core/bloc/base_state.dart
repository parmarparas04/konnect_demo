import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable{

  const BaseState();
  BaseState initial();
}