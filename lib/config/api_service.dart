
const BASE_URL = 'https://www.wanandroid.com/';

const HOME_SERVICE_PATH = {
  'homePageBanner': BASE_URL+'banner/json', // 首页 banner
  'homePageCategory': 'http://api.douban.com/v2/movie/top250', // 首页分类
  'getCategory': BASE_URL+'wxmini/getCategory', //商品类别信息
  'getMallGoods': BASE_URL+'wxmini/getMallGoods', //商品分类的商品列表
  'getGoodDetailById':BASE_URL+'wxmini/getGoodDetailById', //商品详细信息列表
};