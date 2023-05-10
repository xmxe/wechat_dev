var app = getApp();
var util = require('../../utils/util.js');
var api = require('../../config/api.js');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    StatusBar: app.globalData.StatusBar,
    CustomBar: app.globalData.CustomBar,
    array: [
            '招养', '领养', '寄养', '丢失'],
    index: 0,
    petIndex: 0,
    petArray: [],
    disabled: true,
    rules: [{
      name: 'type',
      rules: {required: true, message: '公告类型是必选项'},
  }, {
      name: 'petId',
      rules: {required: true, message: '宠物名是必选项'},
  }, {
      name: 'title',
      rules: {required: true, message: 'qq必填'},
  }, {
      name: 'mobile',
      rules: [{required: true, message: 'mobile必填'}, {mobile: true, message: 'mobile格式不对'}],
  }, {
      name: 'vcode',
      rules: {required: true, message: '验证码必填'},
  }, {
      name: 'idcard',
      rules: {required: true, message: 'idcard必填'},
  }]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  
    this.getPetList()
  },
  getPetList: function(){
    let that = this;
    util.request(api.GetPetList).
    then(function(res) {
        if(res.errno===0){
          that.setData({
            petArray: res.data.list
          });
        } else {
          util.showErrorToast(res.errmsg);
        }
      }
    )
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },
  bindTypePickerChange: function(e){
    this.setData({
      index: e.detail.value
    })
  },
  bindPetPickerChange: function(e){
    this.setData({
      petIndex: e.detail.value
    })
  },
  formSubmit2:function(e){
    let type= e.detail.value.type;
    let title= e.detail.value.title;
    let status= e.detail.value.status;
    let content= e.detail.value.content;
    let petId=e.detail.value.petId;
    console.log("hasLogin",app.globalData.hasLogin)
    if(app.globalData.hasLogin){
      wx.navigateTo({
        url: "/pages/auth/login/login"
      });
    } else{
    util.request(api.CreateNotice,{
      type: type, title: title, status: status, content: content,petId: petId
    },'POST').then(
      function(res){
        if(res.data.errno===0){
          wx.showToast({
            title: '新建成功',
          })
          console.log(res)
          // wx.navigateTo({
          //   url: '../notice/notice'
          // })
        } else{
          util.showErrorToast(res.errmsg);
        }
      }
    )
    console.log(e.detail.value)
  }
},
formSubmit:function(e){
  let that=this;
  console.log("hasLogin",app.globalData.hasLogin)
  if(!app.globalData.hasLogin){
    wx.navigateTo({
      url: "/pages/auth/login/login"
    });
  } else{
  wx.request({
    url:  api.CreateNotice,
    data: {
    type: e.detail.value.type,
    title: e.detail.value.title,
    status: e.detail.value.status,
    content: e.detail.value.content,
    petId: that.data.petArray[e.detail.value.petId].id
  },
  method: 'POST',
  header: {
    //TODO
    'X-hospital-Token': wx.getStorageSync('token'),
    "Content-Type": "application/json"
  },
  success: function(res){
    console.log("Res",res)
      if(res.data.errno===0){
        wx.showToast({
          title: '新建成功',
          icon: 'success',
          duration: 3000
        })
        wx.switchTab({
          url: '/pages/notice/notice'
        })
      }
    }
  }
  )
}
  console.log(e.detail.value)

},
  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

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