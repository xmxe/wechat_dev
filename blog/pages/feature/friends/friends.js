Page({
    data: {},
    // 跳转到小猪冒险
    navigateToXiaoZhu: function () {
        wx.navigateToMiniProgram({
            appId: 'wxc479c52fc974f8b6',
            path: '',
            extraData: {},
            envVersion: '',
            success(res) {
                // 打开成功
            }
        })
    },
    // 跳转到文字宝
    navigateToWenZiBao: function () {
        wx.navigateToMiniProgram({
            appId: 'wx8a6365c417531c80',
            path: '',
            extraData: {},
            envVersion: '',
            success(res) {
                // 打开成功
            }
        })
    },
    // 跳转到24节气
    navigateToJieQi: function () {
        wx.navigateToMiniProgram({
            appId: 'wx7b0eb47b661310e7',
            path: '',
            extraData: {},
            envVersion: '',
            success(res) {
                // 打开成功
            }
        })
    }
})