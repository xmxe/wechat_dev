Page({
    data: {
        url: ''
    },
    onLoad: function (options) {
        const { url } = options
        let fromPath = decodeURIComponent(url);
        this.setData({
            url: fromPath
        })
    },
})