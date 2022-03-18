class CovidCountry {
  String? iD;
  String? country;
  String? countryCode;
  String? province;
  String? city;
  String? cityCode;
  String? lat;
  String? lon;
  int? confirmed;
  int? deaths;
  int? recovered;
  int? active;
  String? date;

  CovidCountry(
      {iD,
      country,
      countryCode,
      province,
      city,
      cityCode,
      lat,
      lon,
      confirmed,
      deaths,
      recovered,
      active,
      date});

  CovidCountry.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    country = json['Country'];
    countryCode = json['CountryCode'];
    province = json['Province'];
    city = json['City'];
    cityCode = json['CityCode'];
    lat = json['Lat'];
    lon = json['Lon'];
    confirmed = json['Confirmed'];
    deaths = json['Deaths'];
    recovered = json['Recovered'];
    active = json['Active'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Country'] = country;
    data['CountryCode'] = countryCode;
    data['Province'] = province;
    data['City'] = city;
    data['CityCode'] = cityCode;
    data['Lat'] = lat;
    data['Lon'] = lon;
    data['Confirmed'] = confirmed;
    data['Deaths'] = deaths;
    data['Recovered'] = recovered;
    data['Active'] = active;
    data['Date'] = date;
    return data;
  }
}
