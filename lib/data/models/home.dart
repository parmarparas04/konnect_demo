class HomeResponse {
  HomeResponse({
    required this.home,
  });
  late final List<Home> home;
  
  HomeResponse.fromJson(Map<String, dynamic> json){
    home = List.from(json['home']).map((e)=>Home.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['home'] = home.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Home {
  Home({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  late final String title;
  late final String subtitle;
  late final String icon;
  
  Home.fromJson(Map<String, dynamic> json){
    title = json['title'];
    subtitle = json['subtitle'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['subtitle'] = subtitle;
    _data['icon'] = icon;
    return _data;
  }
}