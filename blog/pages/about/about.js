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
        wxRequest.getRequest(Api.getPosts()).then(res => {
            if (res.statusCode == 200) {
                const resData = res.data;
                // 创建一个Set
                const categoriesSet = new Set();
                const tagsSet = new Set();
                resData.forEach(item => {
                    item.categories.forEach(categorie => {
                        categoriesSet.add(categorie.name);
                    });
                    item.tags.forEach(tag => {
                        tagsSet.add(tag.name);
                    });
                });
                me.setData({
                    posts: {
                        length: resData.length,
                        url: '/pages/nav/archive/archive',
                        text: '文章'
                    },
                    tags: {
                        length: tagsSet.size,
                        url: '/pages/nav/planet/planet?mark=2',
                        text: '标签'
                    },
                    categories: {
                        length: categoriesSet.size,
                        url: '/pages/nav/planet/planet?mark=1',
                        text: '分类'
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