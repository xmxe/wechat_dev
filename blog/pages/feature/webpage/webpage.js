Page({
    data: {
        url: ''
    },
    onLoad: function (options) {
        let fromPath = decodeURIComponent(options.url);
        this.setData({
            url: fromPath
        })
    },
})