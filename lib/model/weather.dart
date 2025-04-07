import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  Weather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    required this.hourlyUnits,
    required this.hourly,
    required this.dailyUnits,
    required this.daily,
  });

  final num? latitude;
  final num? longitude;
  final num? generationtimeMs;
  final num? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final num? elevation;
  final CurrentUnits? currentUnits;
  final Current? current;
  final HourlyUnits? hourlyUnits;
  final Hourly? hourly;
  final DailyUnits? dailyUnits;
  final Daily? daily;

  Weather copyWith({
    num? latitude,
    num? longitude,
    num? generationtimeMs,
    num? utcOffsetSeconds,
    String? timezone,
    String? timezoneAbbreviation,
    num? elevation,
    CurrentUnits? currentUnits,
    Current? current,
    HourlyUnits? hourlyUnits,
    Hourly? hourly,
    DailyUnits? dailyUnits,
    Daily? daily,
  }) {
    return Weather(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      generationtimeMs: generationtimeMs ?? this.generationtimeMs,
      utcOffsetSeconds: utcOffsetSeconds ?? this.utcOffsetSeconds,
      timezone: timezone ?? this.timezone,
      timezoneAbbreviation: timezoneAbbreviation ?? this.timezoneAbbreviation,
      elevation: elevation ?? this.elevation,
      currentUnits: currentUnits ?? this.currentUnits,
      current: current ?? this.current,
      hourlyUnits: hourlyUnits ?? this.hourlyUnits,
      hourly: hourly ?? this.hourly,
      dailyUnits: dailyUnits ?? this.dailyUnits,
      daily: daily ?? this.daily,
    );
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      latitude: json["latitude"],
      longitude: json["longitude"],
      generationtimeMs: json["generationtime_ms"],
      utcOffsetSeconds: json["utc_offset_seconds"],
      timezone: json["timezone"],
      timezoneAbbreviation: json["timezone_abbreviation"],
      elevation: json["elevation"],
      currentUnits:
          json["current_units"] == null
              ? null
              : CurrentUnits.fromJson(json["current_units"]),
      current:
          json["current"] == null ? null : Current.fromJson(json["current"]),
      hourlyUnits:
          json["hourly_units"] == null
              ? null
              : HourlyUnits.fromJson(json["hourly_units"]),
      hourly: json["hourly"] == null ? null : Hourly.fromJson(json["hourly"]),
      dailyUnits:
          json["daily_units"] == null
              ? null
              : DailyUnits.fromJson(json["daily_units"]),
      daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "generationtime_ms": generationtimeMs,
    "utc_offset_seconds": utcOffsetSeconds,
    "timezone": timezone,
    "timezone_abbreviation": timezoneAbbreviation,
    "elevation": elevation,
    "current_units": currentUnits?.toJson(),
    "current": current?.toJson(),
    "hourly_units": hourlyUnits?.toJson(),
    "hourly": hourly?.toJson(),
    "daily_units": dailyUnits?.toJson(),
    "daily": daily?.toJson(),
  };

  @override
  List<Object?> get props => [
    latitude,
    longitude,
    generationtimeMs,
    utcOffsetSeconds,
    timezone,
    timezoneAbbreviation,
    elevation,
    currentUnits,
    current,
    hourlyUnits,
    hourly,
    dailyUnits,
    daily,
  ];
}

class Current extends Equatable {
  Current({
    required this.time,
    required this.interval,
    required this.relativeHumidity2M,
    required this.temperature2M,
    required this.windSpeed10M,
  });

  final String? time;
  final num? interval;
  final int? relativeHumidity2M;
  final num? temperature2M;
  final num? windSpeed10M;

  Current copyWith({
    String? time,
    num? interval,
    int? relativeHumidity2M,
    num? temperature2M,
    num? windSpeed10M,
  }) {
    return Current(
      time: time ?? this.time,
      interval: interval ?? this.interval,
      relativeHumidity2M: relativeHumidity2M ?? this.relativeHumidity2M,
      temperature2M: temperature2M ?? this.temperature2M,
      windSpeed10M: windSpeed10M ?? this.windSpeed10M,
    );
  }

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      time: json["time"],
      interval: json["interval"],
      relativeHumidity2M: json["relative_humidity_2m"],
      temperature2M: json["temperature_2m"],
      windSpeed10M: json["wind_speed_10m"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "relative_humidity_2m": relativeHumidity2M,
    "temperature_2m": temperature2M,
    "wind_speed_10m": windSpeed10M,
  };

  @override
  List<Object?> get props => [
    time,
    interval,
    relativeHumidity2M,
    temperature2M,
    windSpeed10M,
  ];
}

class CurrentUnits extends Equatable {
  CurrentUnits({
    required this.time,
    required this.interval,
    required this.relativeHumidity2M,
    required this.temperature2M,
    required this.windSpeed10M,
  });

  final String? time;
  final String? interval;
  final String? relativeHumidity2M;
  final String? temperature2M;
  final String? windSpeed10M;

  CurrentUnits copyWith({
    String? time,
    String? interval,
    String? relativeHumidity2M,
    String? temperature2M,
    String? windSpeed10M,
  }) {
    return CurrentUnits(
      time: time ?? this.time,
      interval: interval ?? this.interval,
      relativeHumidity2M: relativeHumidity2M ?? this.relativeHumidity2M,
      temperature2M: temperature2M ?? this.temperature2M,
      windSpeed10M: windSpeed10M ?? this.windSpeed10M,
    );
  }

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
      time: json["time"],
      interval: json["interval"],
      relativeHumidity2M: json["relative_humidity_2m"],
      temperature2M: json["temperature_2m"],
      windSpeed10M: json["wind_speed_10m"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "relative_humidity_2m": relativeHumidity2M,
    "temperature_2m": temperature2M,
    "wind_speed_10m": windSpeed10M,
  };

  @override
  List<Object?> get props => [
    time,
    interval,
    relativeHumidity2M,
    temperature2M,
    windSpeed10M,
  ];
}

class Daily extends Equatable {
  Daily({
    required this.time,
    required this.weatherCode,
    required this.temperature2MMin,
    required this.temperature2MMax,
    required this.windSpeed10MMax,
    required this.uvIndexMax,
  });

  final List<DateTime> time;
  final List<num> weatherCode;
  final List<num> temperature2MMin;
  final List<num> temperature2MMax;
  final List<num> windSpeed10MMax;
  final List<num> uvIndexMax;

  Daily copyWith({
    List<DateTime>? time,
    List<num>? weatherCode,
    List<num>? temperature2MMin,
    List<num>? temperature2MMax,
    List<num>? windSpeed10MMax,
    List<num>? uvIndexMax,
  }) {
    return Daily(
      time: time ?? this.time,
      weatherCode: weatherCode ?? this.weatherCode,
      temperature2MMin: temperature2MMin ?? this.temperature2MMin,
      temperature2MMax: temperature2MMax ?? this.temperature2MMax,
      windSpeed10MMax: windSpeed10MMax ?? this.windSpeed10MMax,
      uvIndexMax: uvIndexMax ?? this.uvIndexMax,
    );
  }

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time:
          json["time"] == null
              ? []
              : List<DateTime>.from(
                json["time"]!.map((x) => DateTime.tryParse(x ?? "")),
              ),
      weatherCode:
          json["weather_code"] == null
              ? []
              : List<num>.from(json["weather_code"]!.map((x) => x)),
      temperature2MMin:
          json["temperature_2m_min"] == null
              ? []
              : List<num>.from(json["temperature_2m_min"]!.map((x) => x)),
      temperature2MMax:
          json["temperature_2m_max"] == null
              ? []
              : List<num>.from(json["temperature_2m_max"]!.map((x) => x)),
      windSpeed10MMax:
          json["wind_speed_10m_max"] == null
              ? []
              : List<num>.from(json["wind_speed_10m_max"]!.map((x) => x)),
      uvIndexMax:
          json["uv_index_max"] == null
              ? []
              : List<num>.from(json["uv_index_max"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "time":
        time
            .map(
              (x) =>
                  "${x.year.toString().padLeft(4)}-${x.month.toString().padLeft(2)}-${x.day.toString().padLeft(2)}",
            )
            .toList(),
    "weather_code": weatherCode.map((x) => x).toList(),
    "temperature_2m_min": temperature2MMin.map((x) => x).toList(),
    "temperature_2m_max": temperature2MMax.map((x) => x).toList(),
    "wind_speed_10m_max": windSpeed10MMax.map((x) => x).toList(),
    "uv_index_max": uvIndexMax.map((x) => x).toList(),
  };

  @override
  List<Object?> get props => [
    time,
    weatherCode,
    temperature2MMin,
    temperature2MMax,
    windSpeed10MMax,
    uvIndexMax,
  ];
}

class DailyUnits extends Equatable {
  DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.temperature2MMin,
    required this.temperature2MMax,
    required this.windSpeed10MMax,
    required this.uvIndexMax,
  });

  final String? time;
  final String? weatherCode;
  final String? temperature2MMin;
  final String? temperature2MMax;
  final String? windSpeed10MMax;
  final String? uvIndexMax;

  DailyUnits copyWith({
    String? time,
    String? weatherCode,
    String? temperature2MMin,
    String? temperature2MMax,
    String? windSpeed10MMax,
    String? uvIndexMax,
  }) {
    return DailyUnits(
      time: time ?? this.time,
      weatherCode: weatherCode ?? this.weatherCode,
      temperature2MMin: temperature2MMin ?? this.temperature2MMin,
      temperature2MMax: temperature2MMax ?? this.temperature2MMax,
      windSpeed10MMax: windSpeed10MMax ?? this.windSpeed10MMax,
      uvIndexMax: uvIndexMax ?? this.uvIndexMax,
    );
  }

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json["time"],
      weatherCode: json["weather_code"],
      temperature2MMin: json["temperature_2m_min"],
      temperature2MMax: json["temperature_2m_max"],
      windSpeed10MMax: json["wind_speed_10m_max"],
      uvIndexMax: json["uv_index_max"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "weather_code": weatherCode,
    "temperature_2m_min": temperature2MMin,
    "temperature_2m_max": temperature2MMax,
    "wind_speed_10m_max": windSpeed10MMax,
    "uv_index_max": uvIndexMax,
  };

  @override
  List<Object?> get props => [
    time,
    weatherCode,
    temperature2MMin,
    temperature2MMax,
    windSpeed10MMax,
    uvIndexMax,
  ];
}

class Hourly extends Equatable {
  Hourly({
    required this.time,
    required this.temperature2M,
    required this.snowfall,
    required this.windSpeed10M,
    required this.visibility,
    required this.weatherCode,
    required this.precipitation,
    required this.relativeHumidity2M,
  });

  final List<String> time;
  final List<num> temperature2M;
  final List<num> snowfall;
  final List<num> windSpeed10M;
  final List<num> visibility;
  final List<num> weatherCode;
  final List<num> precipitation;
  final List<num> relativeHumidity2M;

  Hourly copyWith({
    List<String>? time,
    List<num>? temperature2M,
    List<num>? snowfall,
    List<num>? windSpeed10M,
    List<num>? visibility,
    List<num>? weatherCode,
    List<num>? precipitation,
    List<num>? relativeHumidity2M,
  }) {
    return Hourly(
      time: time ?? this.time,
      temperature2M: temperature2M ?? this.temperature2M,
      snowfall: snowfall ?? this.snowfall,
      windSpeed10M: windSpeed10M ?? this.windSpeed10M,
      visibility: visibility ?? this.visibility,
      weatherCode: weatherCode ?? this.weatherCode,
      precipitation: precipitation ?? this.precipitation,
      relativeHumidity2M: relativeHumidity2M ?? this.relativeHumidity2M,
    );
  }

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      time:
          json["time"] == null
              ? []
              : List<String>.from(json["time"]!.map((x) => x)),
      temperature2M:
          json["temperature_2m"] == null
              ? []
              : List<num>.from(json["temperature_2m"]!.map((x) => x)),
      snowfall:
          json["snowfall"] == null
              ? []
              : List<num>.from(json["snowfall"]!.map((x) => x)),
      windSpeed10M:
          json["wind_speed_10m"] == null
              ? []
              : List<num>.from(json["wind_speed_10m"]!.map((x) => x)),
      visibility:
          json["visibility"] == null
              ? []
              : List<num>.from(json["visibility"]!.map((x) => x)),
      weatherCode:
          json["weather_code"] == null
              ? []
              : List<num>.from(json["weather_code"]!.map((x) => x)),
      precipitation:
          json["precipitation"] == null
              ? []
              : List<num>.from(json["precipitation"]!.map((x) => x)),
      relativeHumidity2M:
          json["relative_humidity_2m"] == null
              ? []
              : List<num>.from(json["relative_humidity_2m"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time.map((x) => x).toList(),
    "temperature_2m": temperature2M.map((x) => x).toList(),
    "snowfall": snowfall.map((x) => x).toList(),
    "wind_speed_10m": windSpeed10M.map((x) => x).toList(),
    "visibility": visibility.map((x) => x).toList(),
    "weather_code": weatherCode.map((x) => x).toList(),
    "precipitation": precipitation.map((x) => x).toList(),
    "relative_humidity_2m": relativeHumidity2M.map((x) => x).toList(),
  };

  @override
  List<Object?> get props => [
    time,
    temperature2M,
    snowfall,
    windSpeed10M,
    visibility,
    weatherCode,
    precipitation,
    relativeHumidity2M,
  ];
}

class HourlyUnits extends Equatable {
  HourlyUnits({
    required this.time,
    required this.temperature2M,
    required this.snowfall,
    required this.windSpeed10M,
    required this.visibility,
    required this.weatherCode,
    required this.precipitation,
    required this.relativeHumidity2M,
  });

  final String? time;
  final String? temperature2M;
  final String? snowfall;
  final String? windSpeed10M;
  final String? visibility;
  final String? weatherCode;
  final String? precipitation;
  final String? relativeHumidity2M;

  HourlyUnits copyWith({
    String? time,
    String? temperature2M,
    String? snowfall,
    String? windSpeed10M,
    String? visibility,
    String? weatherCode,
    String? precipitation,
    String? relativeHumidity2M,
  }) {
    return HourlyUnits(
      time: time ?? this.time,
      temperature2M: temperature2M ?? this.temperature2M,
      snowfall: snowfall ?? this.snowfall,
      windSpeed10M: windSpeed10M ?? this.windSpeed10M,
      visibility: visibility ?? this.visibility,
      weatherCode: weatherCode ?? this.weatherCode,
      precipitation: precipitation ?? this.precipitation,
      relativeHumidity2M: relativeHumidity2M ?? this.relativeHumidity2M,
    );
  }

  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      time: json["time"],
      temperature2M: json["temperature_2m"],
      snowfall: json["snowfall"],
      windSpeed10M: json["wind_speed_10m"],
      visibility: json["visibility"],
      weatherCode: json["weather_code"],
      precipitation: json["precipitation"],
      relativeHumidity2M: json["relative_humidity_2m"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "temperature_2m": temperature2M,
    "snowfall": snowfall,
    "wind_speed_10m": windSpeed10M,
    "visibility": visibility,
    "weather_code": weatherCode,
    "precipitation": precipitation,
    "relative_humidity_2m": relativeHumidity2M,
  };

  @override
  List<Object?> get props => [
    time,
    temperature2M,
    snowfall,
    windSpeed10M,
    visibility,
    weatherCode,
    precipitation,
    relativeHumidity2M,
  ];
}
