const appInst = getApp();
const {
    wxRequest,
    Api,
    hitokoto
} = appInst.globalData
/**
 * 个人主页
 */
Page({

    /**
     * 页面的初始数据
     */
    data: {
        hasUserInfo: false,
        text: ''
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        const that = this;
        hitokoto.hitokoto(that, wxRequest, Api.hitokoto())
    },
    to(e) {
        let {
            url
        } = e.currentTarget.dataset
        // wx.navigateTo({
        //     url: `/pages/feature/webpage/webpage?url=${url}`
        // })
        wx.setClipboardData({
            data: url
        })
    },
    // 登录
    getUserProfile(e) {
        // 推荐使用wx.getUserProfile获取用户信息，开发者每次通过该接口获取用户个人信息均需用户确认
        // 开发者妥善保管用户快速填写的头像昵称，避免重复弹窗
        wx.getUserProfile({
            desc: '用于完善会员资料', // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
            success: (res) => {
                wx.setStorageSync("userInfo", res.userInfo);
                this.setData({
                    hasUserInfo: res.userInfo,
                    isLogin: true
                })
                wx.showToast({
                    title: '更新成功',
                    icon: 'none',
                    duration: 1000
                });
            }
        })
    },
    closeLoginPopup() {
        this.setData({
            hasUserInfo: !this.data.hasUserInfo
        })
    },
    // 退出登录
    closeF() {
        wx.clearStorage();
        wx.switchTab({
            url: '/pages/index/index',
            success: (result) => {
                wx.showToast({
                    title: '退出成功',
                    icon: 'none',
                    duration: 1500
                });
            }
        });
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
        let userInfo = wx.getStorageSync('userInfo');
        if (!userInfo) {
            this.setData({
                hasUserInfo: false,
                isLogin: false
            })
        } else {
            this.setData({
                hasUserInfo: userInfo,
                isLogin: true
            })
        }
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
        const that = this;
        hitokoto.hitokoto(that, wxRequest, Api.hitokoto());
        wx.stopPullDownRefresh();
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