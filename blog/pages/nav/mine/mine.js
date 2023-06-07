const appInst = getApp();
const {
    wxRequest,
    Api,
    util,
    config
} = appInst.globalData
const {
    getSocialLink: social_link
} = config
/**
 * 个人主页
 */
Page({

    /**
     * 页面的初始数据
     */
    data: {
        text: '',
        social_link: social_link

    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        const that = this;
        util.hitokoto(that, wxRequest, Api.hitokoto())
    },
    /**
     * 复制到剪切板
     */
    copy(e) {
        let {
            url
        } = e.currentTarget.dataset
        util.clipboard(url)
    }
})