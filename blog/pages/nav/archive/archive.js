const appInst = getApp();
const {
    wxRequest,
    Api,
    util,
    config
} = appInst.globalData
let {
    getStaticImage: staticImage
} = config;
Page({
    data: {
        postsList: [],
        isLastPage: false,
        page: 1, // 请求页数
        pageCounts: 0, // 总的页数
        showerror: "none", // 网络加载失败问题
        showallDisplay: "block",
        isLoading: false,
        floatDisplay: "none", // 底部文章的提示
        text: '',
        staticImage: staticImage
    },
    onLoad: function (options) {
        // this.archiveByMonth()
        // this.archiveByYear()
        this.fetchPostsData()
        const that = this
        util.hitokoto(that, wxRequest, Api.hitokoto())
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
            floatDisplay: "none",
            isLastPage: false,
            page: 1
        });
        this.fetchPostsData();
        const that = this
        util.hitokoto(that, wxRequest, Api.hitokoto())
    },
    /**
     * 跳转至文章详情页
     */
    redictAppDetail: function (e) {
        let {
            url
        } = e.currentTarget.dataset
        if (url) {
            wx.navigateTo({
                url: `/pages/articles/articles?id=${encodeURIComponent(url)}`,
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
                this.setData({
                    showerror: "block",
                    floatDisplay: "none"
                });
            })
            .final(res => {
                wx.hideLoading();
                wx.stopPullDownRefresh();
                this.setData({
                    isLoading: false
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
        errlist[index].cover = staticImage.image404
        this.setData({
            postsList: errlist
        })
    },
    /**
     * 按照月归档处理数据
     */
    archiveByMonth() {
        const that = this
        wxRequest.getRequest(Api.getPosts()).then(res => {
            const newData = res.data.reduce((acc, curr) => {
                const date = curr.date.split('T')[0]
                const dateArr = date.split('-')
                const year = dateArr[0],
                    month = dateArr[1]
                const time = year + '-' + month
                const title = curr.title
                const cover = curr.cover

                const groupIndex = acc.findIndex(item => item.time === time);
                if (groupIndex === -1) {
                    acc.push({
                        time,
                        articles: [{
                            title: title,
                            cover: cover,
                            date: date
                        }]
                    });
                } else {
                    acc[groupIndex].articles.push({
                        title: title,
                        cover: cover,
                        date: date
                    });
                }
                return acc;
            }, []);
            that.setData({
                postsList: newData
            })
        })

    },
    /**
     * 按照年归档处理数据
     */
    archiveByYear() {
        const that = this
        wxRequest.getRequest(Api.getPosts()).then(res => {
            const newData = res.data.reduce((acc, curr) => {
                const date = curr.date.split('T')[0]
                const dateArr = date.split('-')
                const year = dateArr[0]
                const title = curr.title
                const cover = curr.cover

                const groupIndex = acc.findIndex(item => item.year === year);
                if (groupIndex === -1) {
                    acc.push({
                        year,
                        articles: [{
                            title: title,
                            cover: cover,
                            date: date
                        }]
                    });
                } else {
                    acc[groupIndex].articles.push({
                        title: title,
                        cover: cover,
                        date: date
                    });
                }
                return acc;
            }, []);
            that.setData({
                postsList: newData
            })
        })
    }

})