const appInst = getApp();
const {
    config,
    Api,
    wxRequest,
    util
} = appInst.globalData
const towxml = require('../../components/towxml/index')
Page({
    /**
     * 页面的初始数据
     */
    data: {
        isLoding: true,
        htmlText: {},
        author_d: {},
        article: {},
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        let {
            id
        } = options
        if (options !== null) {
            wx.setNavigationBarTitle({
                title: decodeURIComponent(id)
            })
            this.getDetail(decodeURIComponent(id))
        }
    },
    /** 
     * 进入页面后进行请求
     */
    getDetail(e) {
        let _this = this
        wxRequest.getRequest(Api.getArticleDetail(e))
            .then(res => {
                if (res.statusCode == 200) {
                    let result = towxml(`${res.data.content}`, 'markdown', {
                        // 相对资源的base路径
                        base: config.getDomain + '/',
                        // 主题，默认`light`
                        // theme:'dark',
                        // 为元素绑定的事件方法
                        events: {
                            tap: (e) => {
                                const src = e.currentTarget.dataset.data.attrs.src
                                // 图片
                                if (src) {
                                    const url = src.indexOf("oss") != -1 ? "https://images.weserv.nl/?url=" + src : src
                                    wx.previewImage({
                                        current: url, // 当前显示图片的http链接
                                        urls: [url] // 需要预览的图片http链接列表
                                        
                                    })
                                }
                                // a标签
                                else {
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

                            },
                            // 复制代码
                            copy: (e) => {
                                let copyed_code = ""
                                const extract_code = (parsed_item) => {
                                    if (!parsed_item.children) {
                                        return
                                    }
                                    parsed_item.children.forEach(item => {
                                        if (item.raw_tag == "ul" || (item.attrs.class && item.attrs.class.indexOf("h2w__lineNum") != -1)) {
                                            return
                                        } else if (item.raw_tag == "p") {
                                            copyed_code = copyed_code + "\n\n"
                                        } else if (item.raw_tag == "br") {
                                            copyed_code = copyed_code + "\n"
                                        } else if (item.type == "text") {
                                            copyed_code = copyed_code + item.text
                                        } else {
                                            extract_code(item)
                                        }

                                    })
                                }
                                extract_code(e.target.dataset.data)
                                // 写入剪切板
                                util.clipboard(copyed_code)
                            }
                        }
                    });
                    // 更新解析数据
                    _this.setData({
                        article: result,
                        htmlText: res.data,
                        author_d: {
                            name: config.getAuthorname,
                            img: config.getStaticImage.author,
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
            url: `/pages/generic/webpage/webpage?url=${encodeURIComponent(e.detail.src)}&text=${encodeURIComponent(e.detail.text)}`
        })
    },
    /** 
     * 详情页面的跳转
     */
    navTo(e) {
        let {
            name,
            mark
        } = e.currentTarget.dataset
        if (name) {
            const url = mark == 1 ? Api.getCateDetail(name) : Api.getTagDetail(name)
            wx.navigateTo({
                url: `/pages/nav/label/label?url=${encodeURIComponent(url)}&mark=${mark}`
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