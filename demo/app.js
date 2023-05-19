// app.js
App({
    onLaunch() {
        // 展示本地存储能力
        const logs = wx.getStorageSync('logs') || []
        logs.unshift(Date.now())
        wx.setStorageSync('logs', logs)

        // 登录
        wx.login({
            success: res => {
                console.log(res)
                // code:用户登录凭证（有效期五分钟）
                console.log("用户的code:" + res.code);
                // 发送res.code到后台换取openId, sessionKey, unionId
                // 可以传给后台，再经过解析获取用户的openid
                // 或者可以直接使用微信的提供的接口直接获取openid ，方法如下：
                wx.request({
                    // 自行补上自己的APPID和SECRET
                    url: 'https://api.weixin.qq.com/sns/jscode2session?appid=自己的APPID&secret=自己的SECRET&js_code=' + res.code + '&grant_type=authorization_code',
                    success: res => {
                        // 获取到用户的openid
                        console.log("用户在小程序的唯一标识-openid:" + res.data.openid);
                    }
                });
                // 实际上微信不允许将https://api.weixin.qq.com设置为request合法域名中，也就是说无法使用wx.request来调用上面的接口
                // 小程序不像公众号一样，没有专门的获取access_token的接口。小程序access_token的获取是通过调用微信后台的接口来实现的。具体流程如下：
                // 1、获取session_key
                // 小程序可以通过wx.login接口获取code，然后将code发送到服务器后台，在服务器后台通过code调用微信后台的接口，获取session_key和openid。具体实现方法可以参考微信官方文档：登录流程(https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/login.html)。
                // 2、获取access_token
                // 在获取了session_key和openid后，可以通过以下接口获取access_token：
                // https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET，其中APPID和APPSECRET分别为小程序的AppID和AppSecret。该接口返回的数据包含access_token，可以存储在服务端，并定期更新。
            }
        })
    },
    globalData: {
        userInfo: null
    }
})