// CommonJS(module.exports)
const Api = require('./utils/api.js');
const wxRequest = require('./utils/wxRequest.js')
const util = require('./utils/util.js')
// ES6(export default)
import config from './config/config.js'
App({
    onLaunch() {},
    globalData: {
        userInfo: null,
        Api,
        wxRequest,
        config,
        util
    }
})