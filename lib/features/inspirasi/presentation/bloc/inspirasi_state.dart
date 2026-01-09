import 'package:equatable/equatable.dart';
import '../../domain/entities/inspirasi_entity.dart';

abstract class InspirasiState extends Equatable {
  const InspirasiState();
  
  @override
  List<Object> get props => [];
}

class InspirasiInitial extends InspirasiState {}

class InspirasiLoading extends InspirasiState {}

class InspirasiLoaded extends InspirasiState {
  final List<InspirasiEntity> inspirations;

  const InspirasiLoaded(this.inspirations);

  @override
  List<Object> get props => [inspirations];
}

class InspirasiError extends InspirasiState {
  final String message;

  const InspirasiError(this.message);

  @override
  List<Object> get props => [message];
}
