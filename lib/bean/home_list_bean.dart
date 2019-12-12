
class HomeListBean {
  int itemTYpe = 1;
  List<Map> swiper = List();
  List<Map> navigators = List();

  String imageUrl;
  String title;
  String desc;


  String cover;
  String uid;
  AaResultsSite site;  // 需要用到的数据
  bool deleted;
  int crawled;
  String createdAt;
//  String raw;
  String sId;
  String publishedAt;
  String titleT;
//  String content;
  String url;

  HomeListBean({this.cover, this.uid, this.site, this.deleted, this.crawled, this.createdAt, this.sId, this.publishedAt, this.title,this.url});

  HomeListBean.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    uid = json['uid'];
    site = json['site'] != null ? new AaResultsSite.fromJson(json['site']) : null;
    deleted = json['deleted'];
    crawled = json['crawled'];
    createdAt = json['created_at'];
    sId = json['_id'];
    publishedAt = json['published_at'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['uid'] = this.uid;
    if (this.site != null) {
      data['site'] = this.site.toJson();
    }
    data['deleted'] = this.deleted;
    data['crawled'] = this.crawled;
    data['created_at'] = this.createdAt;
    data['_id'] = this.sId;
    data['published_at'] = this.publishedAt;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}

class AaResultsSite {
  int subscribers;
  String catCn;
  String icon;
  String name;
  String id;
  String type;
  String catEn;
  String url;
  String desc;
  String feedId;

  AaResultsSite({this.subscribers, this.catCn, this.icon, this.name, this.id, this.type, this.catEn, this.url, this.desc, this.feedId});

  AaResultsSite.fromJson(Map<String, dynamic> json) {
    subscribers = json['subscribers'];
    catCn = json['cat_cn'];
    icon = json['icon'];
    name = json['name'];
    id = json['id'];
    type = json['type'];
    catEn = json['cat_en'];
    url = json['url'];
    desc = json['desc'];
    feedId = json['feed_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscribers'] = this.subscribers;
    data['cat_cn'] = this.catCn;
    data['icon'] = this.icon;
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['cat_en'] = this.catEn;
    data['url'] = this.url;
    data['desc'] = this.desc;
    data['feed_id'] = this.feedId;
    return data;
  }
}