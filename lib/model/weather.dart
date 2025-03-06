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
    hourlyUnits,
    hourly,
    dailyUnits,
    daily,
  ];
}

class Daily extends Equatable {
  Daily({
    required this.time,
    required this.weatherCode,
    required this.temperature2MMax,
    required this.temperature2MMin,
    required this.uvIndexMax,
    required this.windSpeed10MMax,
  });

  final List<DateTime> time;
  final List<num> weatherCode;
  final List<num> temperature2MMax;
  final List<num> temperature2MMin;
  final List<num> uvIndexMax;
  final List<num> windSpeed10MMax;

  Daily copyWith({
    List<DateTime>? time,
    List<num>? weatherCode,
    List<num>? temperature2MMax,
    List<num>? temperature2MMin,
    List<num>? uvIndexMax,
    List<num>? windSpeed10MMax,
  }) {
    return Daily(
      time: time ?? this.time,
      weatherCode: weatherCode ?? this.weatherCode,
      temperature2MMax: temperature2MMax ?? this.temperature2MMax,
      temperature2MMin: temperature2MMin ?? this.temperature2MMin,
      uvIndexMax: uvIndexMax ?? this.uvIndexMax,
      windSpeed10MMax: windSpeed10MMax ?? this.windSpeed10MMax,
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
      temperature2MMax:
          json["temperature_2m_max"] == null
              ? []
              : List<num>.from(json["temperature_2m_max"]!.map((x) => x)),
      temperature2MMin:
          json["temperature_2m_min"] == null
              ? []
              : List<num>.from(json["temperature_2m_min"]!.map((x) => x)),
      uvIndexMax:
          json["uv_index_max"] == null
              ? []
              : List<num>.from(json["uv_index_max"]!.map((x) => x)),
      windSpeed10MMax:
          json["wind_speed_10m_max"] == null
              ? []
              : List<num>.from(json["wind_speed_10m_max"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "time":
        time
            .map(
              (x) =>
                  "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}",
            )
            .toList(),
    "weather_code": weatherCode.map((x) => x).toList(),
    "temperature_2m_max": temperature2MMax.map((x) => x).toList(),
    "temperature_2m_min": temperature2MMin.map((x) => x).toList(),
    "uv_index_max": uvIndexMax.map((x) => x).toList(),
    "wind_speed_10m_max": windSpeed10MMax.map((x) => x).toList(),
  };

  @override
  List<Object?> get props => [
    time,
    weatherCode,
    temperature2MMax,
    temperature2MMin,
    uvIndexMax,
    windSpeed10MMax,
  ];
}

class DailyUnits extends Equatable {
  const DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.temperature2MMax,
    required this.temperature2MMin,
    required this.uvIndexMax,
    required this.windSpeed10MMax,
  });

  final String? time;
  final String? weatherCode;
  final String? temperature2MMax;
  final String? temperature2MMin;
  final String? uvIndexMax;
  final String? windSpeed10MMax;

  DailyUnits copyWith({
    String? time,
    String? weatherCode,
    String? temperature2MMax,
    String? temperature2MMin,
    String? uvIndexMax,
    String? windSpeed10MMax,
  }) {
    return DailyUnits(
      time: time ?? this.time,
      weatherCode: weatherCode ?? this.weatherCode,
      temperature2MMax: temperature2MMax ?? this.temperature2MMax,
      temperature2MMin: temperature2MMin ?? this.temperature2MMin,
      uvIndexMax: uvIndexMax ?? this.uvIndexMax,
      windSpeed10MMax: windSpeed10MMax ?? this.windSpeed10MMax,
    );
  }

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json["time"],
      weatherCode: json["weather_code"],
      temperature2MMax: json["temperature_2m_max"],
      temperature2MMin: json["temperature_2m_min"],
      uvIndexMax: json["uv_index_max"],
      windSpeed10MMax: json["wind_speed_10m_max"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "weather_code": weatherCode,
    "temperature_2m_max": temperature2MMax,
    "temperature_2m_min": temperature2MMin,
    "uv_index_max": uvIndexMax,
    "wind_speed_10m_max": windSpeed10MMax,
  };

  @override
  List<Object?> get props => [
    time,
    weatherCode,
    temperature2MMax,
    temperature2MMin,
    uvIndexMax,
    windSpeed10MMax,
  ];
}

class Hourly extends Equatable {
  Hourly({
    required this.time,
    required this.relativeHumidity2M,
    required this.showers,
    required this.snowfall,
    required this.visibility,
  });

  final List<String> time;
  final List<num> relativeHumidity2M;
  final List<num> showers;
  final List<num> snowfall;
  final List<num> visibility;

  Hourly copyWith({
    List<String>? time,
    List<num>? relativeHumidity2M,
    List<num>? showers,
    List<num>? snowfall,
    List<num>? visibility,
  }) {
    return Hourly(
      time: time ?? this.time,
      relativeHumidity2M: relativeHumidity2M ?? this.relativeHumidity2M,
      showers: showers ?? this.showers,
      snowfall: snowfall ?? this.snowfall,
      visibility: visibility ?? this.visibility,
    );
  }

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      time:
          json["time"] == null
              ? []
              : List<String>.from(json["time"]!.map((x) => x)),
      relativeHumidity2M:
          json["relative_humidity_2m"] == null
              ? []
              : List<num>.from(json["relative_humidity_2m"]!.map((x) => x)),
      showers:
          json["showers"] == null
              ? []
              : List<num>.from(json["showers"]!.map((x) => x)),
      snowfall:
          json["snowfall"] == null
              ? []
              : List<num>.from(json["snowfall"]!.map((x) => x)),
      visibility:
          json["visibility"] == null
              ? []
              : List<num>.from(json["visibility"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time.map((x) => x).toList(),
    "relative_humidity_2m": relativeHumidity2M.map((x) => x).toList(),
    "showers": showers.map((x) => x).toList(),
    "snowfall": snowfall.map((x) => x).toList(),
    "visibility": visibility.map((x) => x).toList(),
  };

  @override
  List<Object?> get props => [
    time,
    relativeHumidity2M,
    showers,
    snowfall,
    visibility,
  ];
}

class HourlyUnits extends Equatable {
  HourlyUnits({
    required this.time,
    required this.relativeHumidity2M,
    required this.showers,
    required this.snowfall,
    required this.visibility,
  });

  final String? time;
  final String? relativeHumidity2M;
  final String? showers;
  final String? snowfall;
  final String? visibility;

  HourlyUnits copyWith({
    String? time,
    String? relativeHumidity2M,
    String? showers,
    String? snowfall,
    String? visibility,
  }) {
    return HourlyUnits(
      time: time ?? this.time,
      relativeHumidity2M: relativeHumidity2M ?? this.relativeHumidity2M,
      showers: showers ?? this.showers,
      snowfall: snowfall ?? this.snowfall,
      visibility: visibility ?? this.visibility,
    );
  }

  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      time: json["time"],
      relativeHumidity2M: json["relative_humidity_2m"],
      showers: json["showers"],
      snowfall: json["snowfall"],
      visibility: json["visibility"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "relative_humidity_2m": relativeHumidity2M,
    "showers": showers,
    "snowfall": snowfall,
    "visibility": visibility,
  };

  @override
  List<Object?> get props => [
    time,
    relativeHumidity2M,
    showers,
    snowfall,
    visibility,
  ];
}
