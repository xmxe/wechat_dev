var app = getApp();
var util = require('../../../utils/util.js');
var api = require('../../../config/api.js');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    type: 0,
    petIndex: 0,
    doctorList: 0,
    petList: [],
    doctorList: [],
    isDoctor: false
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    console.log("opto",options)
    if(parseInt(options.applyType)<20){
      this.setData({
        isDoctor: true,
        type: parseInt(options.applyType)
      })
    }
    console.log("++++",this.data.isDoctor)
    switch(parseInt(options.applyType)){
      case 11:
        this.setData({
          typeName: "门诊"
        });
        break;
        case 12:
        this.setData({
          typeName: "绝育"
        });
        break;
        case 13:
        this.setData({
          typeName: "疫苗"
        });
        break;
        case 21:
        this.setData({
          typeName: "洗澡"
        });
        break;
        case 22:
        this.setData({
          typeName: "洗牙"
        });
        break;
        case 23:
        this.setData({
          typeName: "美容"
        });
        break;
        case 24:
        this.setData({
          typeName: "其它"
        });
        break;
    }
    this.getPetList();
    this.getDoctorList(parseInt(options.applyType));
    
  },
  getPetList: function(){
    let that = this;
    util.request(api.GetPetList).
    then(function(res) {
      if(res.errno===0){
        that.setData({
          petList: res.data.list
        });
      } else {
        util.showErrorToast(res.errmsg);
      }
    })
  },
  getDoctorList: function(type){
    let that = this;
    util.request(api.GetDoctorList,{type:type}).
    then(function(res) {
      if(res.errno===0){
        that.setData({
          doctorList: res.data.list
        });
      } else {
        util.showErrorToast(res.errmsg);
      }
    })
  },
  bindPetPickerChange: function(e){
    this.setData({
      petIndex: e.detail.value
    })
  },
  bindDoctorPickerChange: function(e){
    this.setData({
      doctorIndex: e.detail.value
    })
  },
  formSubmit:function(e){
    let that=this;
    if(!app.globalData.hasLogin){
      wx.navigateTo({
        url: "/pages/auth/login/login"
      });
    } else{
    wx.request({
      url:  api.CreateApply,
      data: {
      type: this.data.type,
      remark: e.detail.value.remark,
      doctorId: that.data.doctorList[e.detail.value.doctorId].id,
      petId: that.data.petList[e.detail.value.petId].id
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
            title: '提交成功',
            icon: 'success',
            duration: 3000
          })
          wx.switchTab({
            url: '/pages/index/index'
          })
        }
      }
    }
    )
  }
    console.log(e.detail.value)
  
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