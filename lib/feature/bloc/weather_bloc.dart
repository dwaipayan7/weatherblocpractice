import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:weatherblocpractice/feature/data/my_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        // Request permission
        bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          emit(WeatherFailure(message: 'Location services are disabled.'));
          return;
        }

        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            emit(WeatherFailure(message: 'Location permissions are denied.'));
            return;
          }
        }

        if (permission == LocationPermission.deniedForever) {
          emit(WeatherFailure(message: 'Location permissions are permanently denied.'));
          return;
        }

        // Fetch the current location
        Position position = await Geolocator.getCurrentPosition();

        // Fetch weather using WeatherFactory
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
          position.latitude,
          position.longitude,
        );

        emit(WeatherSuccess(weather: weather));
        print(weather);
      } catch (e) {
        emit(WeatherFailure(message: e.toString()));
      }
    });
  }
}
