import 'home_list_bean.dart';

class HomeListResponseEntity {
	bool error;
	List<HomeListBean> results;

	HomeListResponseEntity({this.error, this.results});

	HomeListResponseEntity.fromJson(Map<String, dynamic> json) {
		error = json['error'];
		if (json['results'] != null) {
			results = new List<HomeListBean>();(json['results'] as List).forEach((v) { results.add(new HomeListBean.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['error'] = this.error;
		if (this.results != null) {
      data['results'] =  this.results.map((v) => v.toJson()).toList();
    }
		return data;
	}
}
