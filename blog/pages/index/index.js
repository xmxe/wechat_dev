const appInst = getApp();
const {
    config,
    Api,
    wxRequest
} = appInst.globalData
let {
    getWebsiteName: webSiteName,
    getIndexNav: topNav,
    getAd: ad
} = config;

Page({
    data: {
        postsList: [], // 文章列表
        postsShowSwiperList: [], // 轮播i图列表
        isLastPage: false,
        page: 1, // 请求页数
        pageCounts: 0, // 总的页数
        showerror: "none", // 网络加载失败问题
        showallDisplay: "block",
        displaySwiper: "none",
        floatDisplay: "none", // 底部文章的提示
        topNav: topNav, // 导航栏配置
        webSiteName: webSiteName, // 网站的名称
        isFirst: false, // 右上角,
        isLoading: false,
        isAd: ad,
        // 轮播
        indicatorDots: true, // 是否显示圆点
        autoplay: true, // 是否自动滚动
        interval: 3000, // 轮播时间
        duration: 500,
        indicator_color: "rgba(217, 217, 217, 1)", // 指示点颜色
        indicator_active_color: "#3F91F0", // 指示点选中颜色
    },
    /**
     * 用户点击右上角分享
     */
    onShareAppMessage: function () {
        return {
            title: `${webSiteName}`,
            path: 'pages/index/index'
        }
    },
    /**
     * 分享到朋友圈
     */
    onShareTimeline() {
        return {
            title: `${webSiteName}的博客`,
            imageUrl: '/static/images/author.png'
        }
    },
    /**
     * 下拉刷新
     */
    onPullDownRefresh: function () {
        let self = this;
        self.setData({
            isLoading: true,
            postsList: [],
            showerror: "none",
            showallDisplay: "block",
            displaySwiper: "none",
            floatDisplay: "none",
            isLastPage: false,
            page: 1,
            postsShowSwiperList: [],
            listAdsuccess: true
        });
        this.fetchTopFivePosts();
        this.fetchPostsData();
    },
    /**
     * 监听用户上拉触底事件
     */
    onReachBottom: function () {
        let self = this;
        if (!self.data.isLastPage && this.data.page < this.data.pageCounts) {
            self.setData({
                page: self.data.page + 1,
                isLoading: true
            });
            this.fetchPostsData();
        } else {
            self.setData({
                floatDisplay: 'block',
                isLoading: false,
                isLastPage: true,
                showerror: 'none'
            })
        }
    },
    onLoad: function (options) {
        let self = this;
        // 滚动图信息
        self.fetchTopFivePosts();
        // 文章信息
        self.fetchPostsData();
        self.setData({
            isFirst: true
        });
        // 打开小程序右上角提示
        setTimeout(function () {
            self.setData({
                isFirst: false
            });
        }, 5000)
    },
    /**
     * 获取首页滚动图信息
     */
    fetchTopFivePosts: function () {
        let self = this;
        // 获取滑动图片的文章
        wxRequest.getRequest(Api.getswiper())
            .then(response => {
                if (response.statusCode == '200' && response.data.length > 0) {
                    self.setData({
                        displaySwiper: 'block',
                        postsShowSwiperList: response.data
                    })
                } else {
                    self.setData({
                        displaySwiper: "none"
                    });
                }
            }).catch(function (response) {
                self.setData({
                    showerror: "block",
                    floatDisplay: "none"
                });
            }).final(function () {});;
    },
    /**
     * 跳转至查看小程序列表页面或文章详情页
     */
    redictAppDetail: function (e) {
        let {
            url
        } = e.currentTarget.dataset
        if (url) {
            wx.navigateTo({
                url: `/pages/feature/articles/articles?id=${encodeURIComponent(url)}`,
                success: (result) => {},
                fail: () => {},
                complete: () => {}
            });
        }
    },
    /**
     * 获取文章的数据信息
     */
    fetchPostsData(e) {
        let page = this.data.page
        // 请求数据
        wxRequest.getRequest(Api.getPostList(page))
            .then(res => {
                if (res.statusCode == 200) {
                    this.setData({
                        pageCounts: res.data.pageCount,
                        postsList: [...this.data.postsList, ...res.data.data]
                    })
                } else {
                    console.log('最后一页');
                }
            })
            .catch(res => {
                console.log(res);
            })
            .final(res => {
                wx.hideLoading();
                wx.stopPullDownRefresh();
                this.setData({
                    isLoading: false,
                    op: 1
                })
            });
    },
    /**
     * 图片加载失败后问题
     */
    errorImg(e) {
        let {
            index
        } = e.currentTarget.dataset
        let errlist = this.data.postsList
        errlist[index].cover = '/static/images/default_404_img.png'
        this.setData({
            postsList: errlist
        })
    },
    /**
     * 首页工具导航图标跳转
     */
    onNavRedirect: function (e) {
        var redicttype = e.currentTarget.dataset.redicttype;
        var url = e.currentTarget.dataset.url == null ? '' : e.currentTarget.dataset.url;
        var appid = e.currentTarget.dataset.appid == null ? '' : e.currentTarget.dataset.appid;
        var extraData = e.currentTarget.dataset.extraData == null ? '' : e.currentTarget.dataset.extraData;
        // 跳转到小程序内部页面
        if (redicttype == 'apppage') {
            wx.navigateTo({
                url: url
            })
        }
        // 跳转到web-view内嵌的页面 
        else if (redicttype == 'webpage') {
            url = `/pages/feature/webpage/webpage?url=${encodeURIComponent(url)}&text=${encodeURIComponent(url)}`;
            wx.navigateTo({
                url: url
            })
        }
        // 跳转到其他app
        else if (redicttype == 'miniapp') {
            wx.navigateToMiniProgram({
                appId: appid,
                envVersion: 'release',
                path: url,
                extraData: extraData,
                success(res) {
                    // 打开成功
                },
                fail: function (res) {

                }
            })
        }
    }
})