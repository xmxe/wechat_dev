const appInst = getApp();
const {
    config,
    util
} = appInst.globalData
let {
    getFriendsLink: friendsLink
} = config
Page({

    data: {
        friendsLink: friendsLink
    },

    // 跳转到小程序or复制链接
    navigateTo: function (e) {
        const {
            appid
        } = e.currentTarget.dataset
        if (appid.indexOf("http") != -1) {
            util.clipboard(appid)
        } else {
            wx.navigateToMiniProgram({
                appId: `${appid}`,
                // 打开的页面路径，如果为空则打开首页
                path: '',
                // 需要传递给目标小程序的数据，目标小程序可在App.onLaunch，App.onShow中获取到这份数据。
                extraData: {},
                // 要打开的小程序版本
                envVersion: '',
                // 打开成功
                success(res) {

                }
            })
        }

    }
})