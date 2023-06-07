const appInst = getApp();
const {
    config,
    Api,
    wxRequest,
    util
} = appInst.globalData
let {
    getAd: ad,
    getStaticImage: staticImage
} = config
Page({
    /**
     * 页面的初始数据
     */
    data: {
        title: '',
        dataList: [],
        isAd: ad,
        text: '',
        label: '',
        staticImage: staticImage
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        let {
            url,
            mark
        } = options
        if (url) {
            this.getcates(decodeURIComponent(url))
            this.setData({
                label: mark == 1 ? '分类' : '标签'
            })
        }
        const that = this
        util.hitokoto(that, wxRequest, Api.hitokoto())
    },
    /**
     * 获取到某个分类/标签的文章信息
     */
    getcates(url) {
        wxRequest.getRequest(url)
            .then(res => {
                if (res.statusCode == 200) {
                    this.setData({
                        title: res.data.name,
                        dataList: res.data.postlist
                    })
                    wx.setNavigationBarTitle({
                        title: res.data.name
                    })
                }
            })
    },
    /** 
     * 图片加载失败 
     */
    imgerror(e) {
        let {
            index
        } = e.currentTarget.dataset
        let dataList = this.data.dataList
        dataList[index].cover = staticImage.image404
        this.setData({
            dataList
        })
    },
    /** 
     * 页面的跳转
     */
    nav_page(e) {
        let {
            slug
        } = e.currentTarget.dataset
        wx.navigateTo({
            url: `/pages/articles/articles?id=${encodeURIComponent(slug)}`
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