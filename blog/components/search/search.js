/**
 * 搜索组件封装
 */
const appInst = getApp();
const {
    Api,
    wxRequest,
    config
} = appInst.globalData

const {
    getStaticImage: staticImage
} = config

Component({
    /**
     * 组件的属性列表
     */
    properties: {
        src: {
            type: String,
            value: staticImage.search404
        },
    },
    /**
     * 组件的初始数据
     */
    data: {
        classStyle: false,
        allData: [],
        res_list: [],
        key: ''
    },
    /** 进入页面就开始本地的请求 */
    lifetimes: {
        // 生命周期函数，可以为函数，或一个在methods段中定义的方法名
        attached: function () {
            this.getJsonData()
        }
    },
    /**
     * 组件的方法列表
     */
    methods: {
        clickS() {
            this.setData({
                classStyle: !this.data.classStyle
            })
        },
        /** 关键词切割 */
        getInf(str, key) {
            return str.replace(new RegExp(`${key}`, 'g'), `%%${key}%%`).split('%%')
        },
        /** input框输入内容 */
        search_key(e) {
            let _this = this;
            let value = e.detail.value.trim()

            // 处理后的标题和内容
            let res_list = []
            if (value.length !== 0) {
                // 进行遍历处理
                this.data.allData.filter(v => {
                    let reg = new RegExp(`(${value})`, "i")
                    if (reg.test(JSON.stringify(v))) {
                        // e表示开始匹配的索引号,先判断内容是否存在
                        let c = v.content
                        let t = v.title
                        if (c) {
                            let i = v.content.indexOf(value)
                            let start = i - 30 < 0 ? 0 : i - 30
                            let end = i + 50 > v.content.length ? v.content.length : i + 50
                            let matchContent = v.content.substring(start, end).replace(/\n/g, '')
                            c = _this.getInf(matchContent, value)
                        }
                        // 对标题进行切割
                        if (t) {
                            t = _this.getInf(t, value)
                        }
                        // 执行关键词切割
                        res_list.push({
                            "title": t,
                            "content": c,
                            "slug": v.slug
                        })
                        return v
                    }
                })
                this.setData({
                    res_list,
                    key: value.trim()
                });
            } else {
                this.setData({
                    res_list: [],
                    key: value.trim()
                })
            }
        },
        /** 获取json数据 */
        getJsonData() {
            wxRequest.getRequest(Api.getJsonSearch())
                .then(res => {
                    this.setData({
                        allData: res.data
                    })
                })
        },
        /** 页面的跳转 */
        nav_page(e) {
            let {
                slug
            } = e.currentTarget.dataset
            wx.navigateTo({
                url: `/pages/articles/articles?id=${encodeURIComponent(slug)}`
            });
        }
    },
})