class solarSystemModel {
  List<Bodies>? bodies;

  solarSystemModel({this.bodies});

  solarSystemModel.fromJson(Map<String, dynamic> json) {
    if (json['bodies'] != null) {
      bodies = <Bodies>[];
      json['bodies'].forEach((v) {
        bodies!.add(new Bodies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bodies != null) {
      data['bodies'] = this.bodies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bodies {
  String? id;
  String? name;
  String? englishName;
  bool? isPlanet;
  List<Moons>? moons;
  int? semimajorAxis;
  int? perihelion;
  int? aphelion;
  double? eccentricity;
  double? inclination;
  Mass? mass;
  Vol? vol;
  double? density;
  double? gravity;
  double? escape;
  double? meanRadius;
  double? equaRadius;
  double? polarRadius;
  double? flattening;
  String? dimension;
  double? sideralOrbit;
  double? sideralRotation;
  AroundPlanet? aroundPlanet;
  String? discoveredBy;
  String? discoveryDate;
  String? alternativeName;
  double? axialTilt;
  int? avgTemp;
  double? mainAnomaly;
  double? argPeriapsis;
  double? longAscNode;
  String? bodyType;
  String? rel;

  Bodies(
      {this.id,
      this.name,
      this.englishName,
      this.isPlanet,
      this.moons,
      this.semimajorAxis,
      this.perihelion,
      this.aphelion,
      this.eccentricity,
      this.inclination,
      this.mass,
      this.vol,
      this.density,
      this.gravity,
      this.escape,
      this.meanRadius,
      this.equaRadius,
      this.polarRadius,
      this.flattening,
      this.dimension,
      this.sideralOrbit,
      this.sideralRotation,
      this.aroundPlanet,
      this.discoveredBy,
      this.discoveryDate,
      this.alternativeName,
      this.axialTilt,
      this.avgTemp,
      this.mainAnomaly,
      this.argPeriapsis,
      this.longAscNode,
      this.bodyType,
      this.rel});

  Bodies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    englishName = json['englishName'];
    isPlanet = json['isPlanet'];
    if (json['moons'] != null) {
      moons = <Moons>[];
      json['moons'].forEach((v) {
        moons!.add(new Moons.fromJson(v));
      });
    }
    semimajorAxis = json['semimajorAxis'];
    perihelion = json['perihelion'];
    aphelion = json['aphelion'];
    eccentricity = json['eccentricity'];
    inclination = json['inclination'];
    mass = json['mass'] != null ? new Mass.fromJson(json['mass']) : null;
    vol = json['vol'] != null ? new Vol.fromJson(json['vol']) : null;
    density = json['density'];
    gravity = json['gravity'];
    escape = json['escape'];
    meanRadius = json['meanRadius'];
    equaRadius = json['equaRadius'];
    polarRadius = json['polarRadius'];
    flattening = json['flattening'];
    dimension = json['dimension'];
    sideralOrbit = json['sideralOrbit'];
    sideralRotation = json['sideralRotation'];
    aroundPlanet = json['aroundPlanet'] != null
        ? new AroundPlanet.fromJson(json['aroundPlanet'])
        : null;
    discoveredBy = json['discoveredBy'];
    discoveryDate = json['discoveryDate'];
    alternativeName = json['alternativeName'];
    avgTemp = json['avgTemp'];
    mainAnomaly = json['mainAnomaly'];
    argPeriapsis = json['argPeriapsis'];
    longAscNode = json['longAscNode'];
    bodyType = json['bodyType'];
    rel = json['rel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['englishName'] = this.englishName;
    data['isPlanet'] = this.isPlanet;
    if (this.moons != null) {
      data['moons'] = this.moons!.map((v) => v.toJson()).toList();
    }
    data['semimajorAxis'] = this.semimajorAxis;
    data['perihelion'] = this.perihelion;
    data['aphelion'] = this.aphelion;
    data['eccentricity'] = this.eccentricity;
    data['inclination'] = this.inclination;
    if (this.mass != null) {
      data['mass'] = this.mass!.toJson();
    }
    if (this.vol != null) {
      data['vol'] = this.vol!.toJson();
    }
    data['density'] = this.density;
    data['gravity'] = this.gravity;
    data['escape'] = this.escape;
    data['meanRadius'] = this.meanRadius;
    data['equaRadius'] = this.equaRadius;
    data['polarRadius'] = this.polarRadius;
    data['flattening'] = this.flattening;
    data['dimension'] = this.dimension;
    data['sideralOrbit'] = this.sideralOrbit;
    data['sideralRotation'] = this.sideralRotation;
    if (this.aroundPlanet != null) {
      data['aroundPlanet'] = this.aroundPlanet!.toJson();
    }
    data['discoveredBy'] = this.discoveredBy;
    data['discoveryDate'] = this.discoveryDate;
    data['alternativeName'] = this.alternativeName;
    data['axialTilt'] = this.axialTilt;
    data['avgTemp'] = this.avgTemp;
    data['mainAnomaly'] = this.mainAnomaly;
    data['argPeriapsis'] = this.argPeriapsis;
    data['longAscNode'] = this.longAscNode;
    data['bodyType'] = this.bodyType;
    data['rel'] = this.rel;
    return data;
  }
}

class Moons {
  String? moon;
  String? rel;

  Moons({this.moon, this.rel});

  Moons.fromJson(Map<String, dynamic> json) {
    moon = json['moon'];
    rel = json['rel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moon'] = this.moon;
    data['rel'] = this.rel;
    return data;
  }
}

class Mass {
  double? massValue;
  int? massExponent;

  Mass({this.massValue, this.massExponent});

  Mass.fromJson(Map<String, dynamic> json) {
    massValue = json['massValue'];
    massExponent = json['massExponent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massValue'] = this.massValue;
    data['massExponent'] = this.massExponent;
    return data;
  }
}

class Vol {
  double? volValue;
  int? volExponent;

  Vol({this.volValue, this.volExponent});

  Vol.fromJson(Map<String, dynamic> json) {
    volValue = json['volValue'];
    volExponent = json['volExponent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['volValue'] = this.volValue;
    data['volExponent'] = this.volExponent;
    return data;
  }
}

class AroundPlanet {
  String? planet;
  String? rel;

  AroundPlanet({this.planet, this.rel});

  AroundPlanet.fromJson(Map<String, dynamic> json) {
    planet = json['planet'];
    rel = json['rel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['planet'] = this.planet;
    data['rel'] = this.rel;
    return data;
  }
}
