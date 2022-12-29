part of 'cdi_bloc.dart';

abstract class CdiState extends Equatable {
  const CdiState();  

  @override
  List<Object> get props => [];
}
class CdiInitial extends CdiState {}
