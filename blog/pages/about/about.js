const appInst = getApp();
const {
    wxRequest,
    Api,
    util,
    config
} = appInst.globalData
const {
    getStaticImage: staticImage,
    getAboutList: aboutList
} = config

Page({
    /**
     * 页面的初始数据
     */
    data: {
        text: '',
        staticImage: staticImage,
        aboutList: aboutList,
        categories: {},
        tags: {},
        posts: {}
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        const that = this;
        util.hitokoto(that, wxRequest, Api.hitokoto())
    },

    /**
     * 跳转页面 
     */
    redictPage: function (e) {
        let {
            url
        } = e.currentTarget.dataset
        if (url) {
            wx.navigateTo({
                url: url,
                success: (result) => {},
                fail: () => {},
                complete: () => {}
            });
        }
    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady: function () {
        let me = this
        wxRequest.getRequest(Api.getCategories()).then(res => {
            if (res.statusCode == 200) {
                me.setData({
                    categories: {
                        length: res.data.length,
                        url: '/pages/nav/planet/planet?mark=1',
                        text: '分类'
                    }
                })
            }
        })

        wxRequest.getRequest(Api.getTags()).then(res => {
            if (res.statusCode == 200) {
                me.setData({
                    tags: {
                        length: res.data.length,
                        url: '/pages/nav/planet/planet?mark=2',
                        text: '标签'
                    }
                })
            }
        })

        wxRequest.getRequest(Api.getPosts()).then(res => {
            if (res.statusCode == 200) {
                me.setData({
                    posts: {
                        length: res.data.length,
                        url: '/pages/nav/archive/archive',
                        text: '文章'
                    }
                })
            }
        })
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