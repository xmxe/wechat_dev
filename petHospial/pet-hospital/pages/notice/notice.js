var app = getApp();
var WxParse = require('../../lib/wxParse/wxParse.js');
var util = require('../../utils/util.js');
var api = require('../../config/api.js');
var user = require('../../utils/user.js');

// pages/notice/notice.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    "announcementList": [],
    hasLogin: false
  },
  toNewNotice: function(){
    wx.navigateTo({
      url: '../newNotice/newNotice',
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      hasLogin: app.globalData.hasLogin
    })
    console.log("----",this.data.hasLogin)
    this.getAnnouncementList()
  },
  goNoticeDetail: function(e){
    let id = e.currentTarget.dataset.id
    wx.navigateTo({
      url: '../noticeDetail/noticeDetail?id='+id,
    })
    console.log(id)
  },

  getAnnouncementList: function(){
    let that=this;
    util.request(api.getAnnouncementList)
    .then(function(res){
      if (res.errno === 0) {
        that.setData({
          announcementList: res.data.list,
        });
      }
    })
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    this.getAnnouncementList()
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})