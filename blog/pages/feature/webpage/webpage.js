Page({
    data: {
        url: '',
        text: ''
    },
    onLoad: function (options) {
        const {
            url,
            text
        } = options
        this.setData({
            url: decodeURIComponent(url),
            text: decodeURIComponent(text)
        })
    },
    /** 复制到剪切板 */
    copy() {
        wx.setClipboardData({
            data: this.data.url
        })
    }
})