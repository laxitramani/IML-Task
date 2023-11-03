class PlaceModel {
  String? icao;
  String? iata;
  String? name;
  String? city;
  String? state;
  String? country;
  int? elevation;
  double? lat;
  double? lon;
  String? tz;

  PlaceModel(
      {this.icao,
      this.iata,
      this.name,
      this.city,
      this.state,
      this.country,
      this.elevation,
      this.lat,
      this.lon,
      this.tz});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    icao = json['icao'];
    iata = json['iata'];
    name = json['name'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    elevation = json['elevation'];
    lat = json['lat'].toDouble();
    lon = json['lon'].toDouble();
    tz = json['tz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icao'] = icao;
    data['iata'] = iata;
    data['name'] = name;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['elevation'] = elevation;
    data['lat'] = lat;
    data['lon'] = lon;
    data['tz'] = tz;
    return data;
  }
}
