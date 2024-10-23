part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent extends Equatable{
  WeatherEvent();

  List<Object> get props => [];

}

class FetchWeather extends WeatherEvent{

}
