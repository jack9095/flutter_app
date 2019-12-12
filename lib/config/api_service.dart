
const BASE_URL = 'https://www.wanandroid.com/';
const BASE_URL_API = 'http://gank.io/api/';

const HOME_SERVICE_PATH = {
  'homePageBanner': BASE_URL+'banner/json', // 首页 banner
  'homePageCategory': 'http://api.douban.com/v2/movie/top250', // 首页分类
  'homeList': BASE_URL_API+'xiandu/data/id/appinn/count/10/page/', // 首页列表
};

const CATEGORY_SERVICE_PATH = {
  'categoryList': BASE_URL_API+'banner/json', // 分类列表
  'categoryDetails': BASE_URL_API+'article/list', // 分类详情
};