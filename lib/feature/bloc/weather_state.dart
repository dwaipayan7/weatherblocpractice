part of 'weather_bloc.dart';

@immutable
sealed class WeatherState extends Equatable{

  const WeatherState();

  List<Object> get props =>[];

}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final Weather weather;

  const WeatherSuccess({required this.weather});

  @override
  List<Object> get props =>[weather];

}

final class WeatherFailure extends WeatherState {
 final String message;

  WeatherFailure({required this.message});
}
