// app.js
const Api = require('./utils/api.js');
const wxRequest = require('./utils/wxRequest.js')
import config from './config/config.js'
App({
    onLaunch() {

    },
    globalData: {
        userInfo: null,
        Api,
        wxRequest,
        config
    }
})