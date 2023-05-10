const util = require('../../utils/util.js');
const api = require('../../config/api.js');
const user = require('../../utils/user.js');

//获取应用实例
const app = getApp();

Page({
  data: {
    applyType: 0,
    newGoods: [],
    hotGoods: [],
    topics: [],
    brands: [
     
    ],
    StatusBar: app.globalData.StatusBar,
    CustomBar: app.globalData.CustomBar,
    iconList: [{
      icon: 'cardboardfill',
      color: 'red',
      badge: 120,
      name: '公告'
    }, {
      icon: 'recordfill',
      color: 'orange',
      badge: 1,
      name: '医院'
    }, {
      icon: 'picfill',
      color: 'yellow',
      badge: 0,
      name: '我的'
    }],
    gridCol:3,
    skin: false,
    groupons: [],
    floorGoods: [],
    floorService: [],
    banner: [
      {
        "id": 0,
        "url": "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1551863367,2204610832&fm=26&gp=0.jpg"
      },
      {
        "id": 1,
        "url": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606797016351&di=a65556aa66c36b3082ae7aaed2ab4a55&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Fback_pic%2F05%2F83%2F38%2F125c5253cd73c1e.jpg"
        
      },{
        "id": 2,
        "url": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606797016352&di=2182c27d0db6fae18ca81be3fb5fdd34&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Fback_pic%2F05%2F19%2F85%2F2459ca503b8954a.jpg"
      },{
        "id": 3,
        "url": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606797016352&di=32dd1a4f52b5683637cb6e2276ef4f8f&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Fback_pic%2F04%2F85%2F98%2F7958e343e434ec9.jpg"
      }
    ],
    channel: [],
    coupon: [],
    goodsCount: 0,
    serviceCount: 0
  },

  onShareAppMessage: function() {
    return {
      title: '便捷洗衣平台',
      desc: '便捷洗衣平台',
      path: '/pages/index/index'
    }
  },

  onPullDownRefresh() {
    wx.showNavigationBarLoading() //在标题栏中显示加载
    //this.getIndexData();
    wx.hideNavigationBarLoading() //完成停止加载
    wx.stopPullDownRefresh() //停止下拉刷新
  },
  addApply: function(e){
    console.log(e)
    let type = e.currentTarget.dataset.apptype
    console.log(type)
    wx.navigateTo({
      url: '/pages/apply/doctor/forDoctor?applyType='+type,
    })
  },

  getIndexData: function() {
    // let that = this;
    // util.request(api.IndexUrl2).then(function(res) {
    //   if (res.errno === 0) {
    //     that.setData({
         
    //       floorService: res.data.floorServiceList,
    //       //banner: res.data.banner,
    //       channel: res.data.channel
    //     });
    //   }
    // });
    // util.request(api.ServiceCount).then(function (res) {
    //   that.setData({
    //     serviceCount: res.data
    //   });
    // });
  },
  onLoad: function(options) {

    // 页面初始化 options为页面跳转所带来的参数
    if (options.scene) {
      //这个scene的值存在则证明首页的开启来源于朋友圈分享的图,同时可以通过获取到的goodId的值跳转导航到对应的详情页
      var scene = decodeURIComponent(options.scene);
      console.log("scene:" + scene);

      let info_arr = [];
      info_arr = scene.split(',');
      let _type = info_arr[0];
      let id = info_arr[1];

      if (_type == 'service') {
        wx.navigateTo({
          url: '../service/service?id=' + id
        });
      } else if (_type == 'groupon') {
        wx.navigateTo({
          url: '../service/service?grouponId=' + id
        });
      } else {
        wx.navigateTo({
          url: '../index/index'
        });
      }
    }

    // 页面初始化 options为页面跳转所带来的参数
    if (options.grouponId) {
      //这个pageId的值存在则证明首页的开启来源于用户点击来首页,同时可以通过获取到的pageId的值跳转导航到对应的详情页
      wx.navigateTo({
        url: '../service/service?grouponId=' + options.grouponId
      });
    }

    // 页面初始化 options为页面跳转所带来的参数
    if (options.goodId) {
      //这个goodId的值存在则证明首页的开启来源于分享,同时可以通过获取到的goodId的值跳转导航到对应的详情页
      wx.navigateTo({
        url: '../service/service?id=' + options.goodId
      });
    }

    // 页面初始化 options为页面跳转所带来的参数
    if (options.orderId) {
      //这个orderId的值存在则证明首页的开启来源于订单模版通知,同时可以通过获取到的pageId的值跳转导航到对应的详情页
      wx.navigateTo({
        url: '../ucenter/orderDetail/orderDetail?id=' + options.orderId
      });
    }

    this.getIndexData();
  },

  toNotice(){
    wx.switchTab({
      url: '/pages/notice/notice',
    })
  },
  toHospital(){
    wx.switchTab({
      url: '/pages/hospital/hospital',
    })
  },
  toUcenter(){
    wx.switchTab({
      url: '/pages/ucenter/index/index',
    })
  },
  onReady: function() {
    // 页面渲染完成
  },
  onShow: function() {
    // 页面显示
  },
  onHide: function() {
    // 页面隐藏
  },
  onUnload: function() {
    // 页面关闭
  },
  getCoupon(e) {
    let couponId = e.currentTarget.dataset.index
    util.request(api.CouponReceive, {
      couponId: couponId
    }, 'POST').then(res => {
      if (res.errno === 0) {
        wx.showToast({
          title: "领取成功"
        })
      }
      else{
        util.showErrorToast(res.errmsg);
      }
    })
  },
})