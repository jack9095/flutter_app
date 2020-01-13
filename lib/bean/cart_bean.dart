
class CartBean {
    bool isChecked = false;
    String title;
    String content;
    String image;

    List<CartBean> lists;
    CartBean mCartBean;

    List<CartBean> getData(){
      lists = List();
      mCartBean = CartBean();
      mCartBean.title = "购物车数据1";
      mCartBean.content = "这是一个商品";
      mCartBean.isChecked = true;
      mCartBean.image = 'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1719063513,2559625643&fm=26&gp=0.jpg';
      lists.add(mCartBean);

      mCartBean = CartBean();
      mCartBean.title = "购物车数据2";
      mCartBean.content = "这是一个商品";
      mCartBean.isChecked = false;
      mCartBean.image = 'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=248222817,375547763&fm=26&gp=0.jpg';
      lists.add(mCartBean);

      mCartBean = CartBean();
      mCartBean.title = "购物车数据3";
      mCartBean.content = "这是一个商品";
      mCartBean.isChecked = false;
      mCartBean.image = 'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3008142408,2229729459&fm=26&gp=0.jpg';
      lists.add(mCartBean);

      mCartBean = CartBean();
      mCartBean.title = "购物车数据4";
      mCartBean.content = "这是一个商品";
      mCartBean.isChecked = false;
      mCartBean.image = 'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1719063513,2559625643&fm=26&gp=0.jpg';
      lists.add(mCartBean);

      mCartBean = CartBean();
      mCartBean.title = "购物车数据5";
      mCartBean.content = "这是一个商品";
      mCartBean.isChecked = false;
      mCartBean.image = 'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2174653899,3494771742&fm=26&gp=0.jpg';
      lists.add(mCartBean);
      return lists;
    }
}