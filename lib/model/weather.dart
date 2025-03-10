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
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.precipitation,
    required this.snowfall,
    required this.weatherCode,
  });

  final String? time;
  final num? interval;
  final num? temperature2M;
  final int? relativeHumidity2M;
  final num? precipitation;
  final num? snowfall;
  final num? weatherCode;

  Current copyWith({
    String? time,
    num? interval,
    num? temperature2M,
    int? relativeHumidity2M,
    num? precipitation,
    num? snowfall,
    num? weatherCode,
  }) {
    return Current(
      time: time ?? this.time,
      interval: interval ?? this.interval,
      temperature2M: temperature2M ?? this.temperature2M,
      relativeHumidity2M: relativeHumidity2M ?? this.relativeHumidity2M,
      precipitation: precipitation ?? this.precipitation,
      snowfall: snowfall ?? this.snowfall,
      weatherCode: weatherCode ?? this.weatherCode,
    );
  }

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      time: json["time"],
      interval: json["interval"],
      temperature2M: json["temperature_2m"],
      relativeHumidity2M: json["relative_humidity_2m"],
      precipitation: json["precipitation"],
      snowfall: json["snowfall"],
      weatherCode: json["weather_code"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2M,
    "relative_humidity_2m": relativeHumidity2M,
    "precipitation": precipitation,
    "snowfall": snowfall,
    "weather_code": weatherCode,
  };

  @override
  List<Object?> get props => [
    time,
    interval,
    temperature2M,
    relativeHumidity2M,
    precipitation,
    snowfall,
    weatherCode,
  ];
}

class CurrentUnits extends Equatable {
  CurrentUnits({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.precipitation,
    required this.snowfall,
    required this.weatherCode,
  });

  final String? time;
  final String? interval;
  final String? temperature2M;
  final String? relativeHumidity2M;
  final String? precipitation;
  final String? snowfall;
  final String? weatherCode;

  CurrentUnits copyWith({
    String? time,
    String? interval,
    String? temperature2M,
    String? relativeHumidity2M,
    String? precipitation,
    String? snowfall,
    String? weatherCode,
  }) {
    return CurrentUnits(
      time: time ?? this.time,
      interval: interval ?? this.interval,
      temperature2M: temperature2M ?? this.temperature2M,
      relativeHumidity2M: relativeHumidity2M ?? this.relativeHumidity2M,
      precipitation: precipitation ?? this.precipitation,
      snowfall: snowfall ?? this.snowfall,
      weatherCode: weatherCode ?? this.weatherCode,
    );
  }

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
      time: json["time"],
      interval: json["interval"],
      temperature2M: json["temperature_2m"],
      relativeHumidity2M: json["relative_humidity_2m"],
      precipitation: json["precipitation"],
      snowfall: json["snowfall"],
      weatherCode: json["weather_code"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2M,
    "relative_humidity_2m": relativeHumidity2M,
    "precipitation": precipitation,
    "snowfall": snowfall,
    "weather_code": weatherCode,
  };

  @override
  List<Object?> get props => [
    time,
    interval,
    temperature2M,
    relativeHumidity2M,
    precipitation,
    snowfall,
    weatherCode,
  ];
}

class Daily extends Equatable {
  Daily({
    required this.time,
    required this.temperature2MMax,
    required this.temperature2MMin,
    required this.uvIndexMax,
  });

  final List<DateTime> time;
  final List<num> temperature2MMax;
  final List<num> temperature2MMin;
  final List<num> uvIndexMax;

  Daily copyWith({
    List<DateTime>? time,
    List<num>? temperature2MMax,
    List<num>? temperature2MMin,
    List<num>? uvIndexMax,
  }) {
    return Daily(
      time: time ?? this.time,
      temperature2MMax: temperature2MMax ?? this.temperature2MMax,
      temperature2MMin: temperature2MMin ?? this.temperature2MMin,
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
    "temperature_2m_max": temperature2MMax.map((x) => x).toList(),
    "temperature_2m_min": temperature2MMin.map((x) => x).toList(),
    "uv_index_max": uvIndexMax.map((x) => x).toList(),
  };

  @override
  List<Object?> get props => [
    time,
    temperature2MMax,
    temperature2MMin,
    uvIndexMax,
  ];
}

class DailyUnits extends Equatable {
  DailyUnits({
    required this.time,
    required this.temperature2MMax,
    required this.temperature2MMin,
    required this.uvIndexMax,
  });

  final String? time;
  final String? temperature2MMax;
  final String? temperature2MMin;
  final String? uvIndexMax;

  DailyUnits copyWith({
    String? time,
    String? temperature2MMax,
    String? temperature2MMin,
    String? uvIndexMax,
  }) {
    return DailyUnits(
      time: time ?? this.time,
      temperature2MMax: temperature2MMax ?? this.temperature2MMax,
      temperature2MMin: temperature2MMin ?? this.temperature2MMin,
      uvIndexMax: uvIndexMax ?? this.uvIndexMax,
    );
  }

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json["time"],
      temperature2MMax: json["temperature_2m_max"],
      temperature2MMin: json["temperature_2m_min"],
      uvIndexMax: json["uv_index_max"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "temperature_2m_max": temperature2MMax,
    "temperature_2m_min": temperature2MMin,
    "uv_index_max": uvIndexMax,
  };

  @override
  List<Object?> get props => [
    time,
    temperature2MMax,
    temperature2MMin,
    uvIndexMax,
  ];
}

class Hourly extends Equatable {
  Hourly({
    required this.time,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.snowfall,
    required this.weatherCode,
    required this.visibility,
  });

  final List<String> time;
  final List<num> temperature2M;
  final List<num> relativeHumidity2M;
  final List<num> snowfall;
  final List<num> weatherCode;
  final List<num> visibility;

  Hourly copyWith({
    List<String>? time,
    List<num>? temperature2M,
    List<num>? relativeHumidity2M,
    List<num>? snowfall,
    List<num>? weatherCode,
    List<num>? visibility,
  }) {
    return Hourly(
      time: time ?? this.time,
      temperature2M: temperature2M ?? this.temperature2M,
      relativeHumidity2M: relativeHumidity2M ?? this.relativeHumidity2M,
      snowfall: snowfall ?? this.snowfall,
      weatherCode: weatherCode ?? this.weatherCode,
      visibility: visibility ?? this.visibility,
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
      relativeHumidity2M:
          json["relative_humidity_2m"] == null
              ? []
              : List<num>.from(json["relative_humidity_2m"]!.map((x) => x)),
      snowfall:
          json["snowfall"] == null
              ? []
              : List<num>.from(json["snowfall"]!.map((x) => x)),
      weatherCode:
          json["weather_code"] == null
              ? []
              : List<num>.from(json["weather_code"]!.map((x) => x)),
      visibility:
          json["visibility"] == null
              ? []
              : List<num>.from(json["visibility"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time.map((x) => x).toList(),
    "temperature_2m": temperature2M.map((x) => x).toList(),
    "relative_humidity_2m": relativeHumidity2M.map((x) => x).toList(),
    "snowfall": snowfall.map((x) => x).toList(),
    "weather_code": weatherCode.map((x) => x).toList(),
    "visibility": visibility.map((x) => x).toList(),
  };

  @override
  List<Object?> get props => [
    time,
    temperature2M,
    relativeHumidity2M,
    snowfall,
    weatherCode,
    visibility,
  ];
}

class HourlyUnits extends Equatable {
  HourlyUnits({
    required this.time,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.snowfall,
    required this.weatherCode,
    required this.visibility,
  });

  final String? time;
  final String? temperature2M;
  final String? relativeHumidity2M;
  final String? snowfall;
  final String? weatherCode;
  final String? visibility;

  HourlyUnits copyWith({
    String? time,
    String? temperature2M,
    String? relativeHumidity2M,
    String? snowfall,
    String? weatherCode,
    String? visibility,
  }) {
    return HourlyUnits(
      time: time ?? this.time,
      temperature2M: temperature2M ?? this.temperature2M,
      relativeHumidity2M: relativeHumidity2M ?? this.relativeHumidity2M,
      snowfall: snowfall ?? this.snowfall,
      weatherCode: weatherCode ?? this.weatherCode,
      visibility: visibility ?? this.visibility,
    );
  }

  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      time: json["time"],
      temperature2M: json["temperature_2m"],
      relativeHumidity2M: json["relative_humidity_2m"],
      snowfall: json["snowfall"],
      weatherCode: json["weather_code"],
      visibility: json["visibility"],
    );
  }

  Map<String, dynamic> toJson() => {
    "time": time,
    "temperature_2m": temperature2M,
    "relative_humidity_2m": relativeHumidity2M,
    "snowfall": snowfall,
    "weather_code": weatherCode,
    "visibility": visibility,
  };

  @override
  List<Object?> get props => [
    time,
    temperature2M,
    relativeHumidity2M,
    snowfall,
    weatherCode,
    visibility,
  ];
}
