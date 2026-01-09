import 'package:equatable/equatable.dart';

abstract class InspirasiEvent extends Equatable {
  const InspirasiEvent();

  @override
  List<Object> get props => [];
}

class GetInspirationsRequested extends InspirasiEvent {}
