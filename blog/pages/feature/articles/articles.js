const appInst = getApp();
const {
    config,
    Api,
    wxRequest
} = appInst.globalData
const towxml = require('../../../components/towxml/index')
Page({

    /**
     * 页面的初始数据
     */
    data: {
        isLoding: true,
        htmlText: '',
        author_d: {},
        article: {}
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        let {
            id
        } = options
        if (options !== null) {
            this.getDetail(decodeURIComponent(id))
        }
    },
    // 进入页面后进行请求
    getDetail(e) {
        let _this = this
        wxRequest.getRequest(Api.getArticleDetail(e))
            .then(res => {
                if (res.statusCode == 200) {
                    let result = towxml(`${res.data.content}`, 'markdown', {
                        // 相对资源的base路径
                        // base:'https://xxx.com',
                        // 主题，默认`light`
                        // theme:'dark',
                        // 为元素绑定的事件方法
                        events: {
                            tap: (e) => {
                                
                                const event = {
                                    detail: {
                                        src: e.currentTarget.dataset.data.attrs.href,
                                        text: e.currentTarget.dataset.data.children[0].text
                                    }
                                }
                                if (event.detail.src) {
                                    _this.wxmlTagATap(event)
                                }
                            }
                        }
                    });
                    // 更新解析数据
                    _this.setData({
                        article: result,
                        htmlText: res.data,
                        author_d: {
                            name: config.getAuthorname,
                            img: config.getAuthorImg,
                            domain: config.getDomain,
                            webname: config.getWebsiteName
                        },
                        isLoding: false
                    })
                }
            })
    },
    /*
     * a标签事件
     */
    wxmlTagATap(e) {
        wx.navigateTo({
            url: `/pages/feature/webpage/webpage?url=${encodeURIComponent(e.detail.src)}&text=${encodeURIComponent(e.detail.text)}`
        })
    },
    /** 详情页面的跳转 */
    navTo(e) {
        let {
            name,
            mark
        } = e.currentTarget.dataset
        if (name) {
            const url = mark == 1 ? Api.getCateDetail(name) : Api.getTagDetail(name)
            wx.navigateTo({
                url: `/pages/feature/tags/tags?url=${encodeURIComponent(url)}&mark=${mark}`
            });
        }
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