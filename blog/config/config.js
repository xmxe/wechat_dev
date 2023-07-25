// 配置域名,域名只修改此处。可以配置为根域名
const DOMAIN = "https://xmxe.gitee.io/blog"
// const DOMAIN = "http://localhost:4000/blog"
// 网站名称
const WEBSITENAME = "熊猫小二"
// 文章作者的名称
const ARTICLE_AUTHOR_NAME = "xmxe"

const STATICIMAGE = {
    // 微信鼓励的图片链接，用于个人小程序的赞赏
    contribute: DOMAIN + "/static/images/zanshang.jpg",
    // 文章作者的头像,这里是相对于文章页的地址
    author: DOMAIN + "/static/images/author.png",
    // 搜索404
    search404: DOMAIN + "/static/images/search_404.png",
    // 图片404
    image404: "/static/images/error.svg",
    // 网络错误
    web_error: "/static/images/error.svg",
    // 分类图片
    categoryImage: DOMAIN + "/static/images/category.png",
    // 标签图片
    tagImage: DOMAIN + "/static/images/tag.png",
    // 波浪动图
    bg_wave: DOMAIN + "/static/images/bg_wave.gif",
    // 列表星球关于
    about_cate: DOMAIN + "/static/images/about_cate.png",
    // 文章时间图片
    calendar: DOMAIN + "/static/images/calendar.png"
}

// 是否开启广告
const ISAD = {
    "enable": false,
    "bannerId": 'adunit-c9dae21126085de9'
}

// 首页图标导航
const INDEXNAV = [{
        id: '1',
        // 'name'为名称
        name: '分类',
        // 'image'为图标路径
        image: DOMAIN + '/static/images/index/1.png',
        // 'url'为跳转的页面
        url: '/pages/nav/planet/planet?mark=1',
        // redirecttype为跳转的类型
        // miniapp:跳转其他小程序,url为其他小程序的页面
        // apppage:跳转本小程序的页面,url为本小程序的页面路径
        // webpage:web-view页面
        redirecttype: 'apppage',
        // 'appid':redirecttype为miniapp时，这个值为其他微信小程序的appid，如果为apppage、webpage时,这个值设置为空。
        appid: '',
        // 'extraData':当redirecttype为miniapp时，这个值为提交到其他微信小程序的参数，如果为apppage、webpage时,这个值设置为空。
        extraData: ''
    },
    {
        id: '2',
        name: '标签',
        image: DOMAIN + '/static/images/index/2.png',
        url: '/pages/nav/planet/planet?mark=2',
        redirecttype: 'apppage',
        appid: '',
        extraData: ''
    },
    {
        id: '3',
        name: '归档',
        image: DOMAIN + '/static/images/index/3.png',
        url: '/pages/nav/archive/archive',
        redirecttype: 'apppage',
        appid: '',
        extraData: ''
    }
]

// 首页轮播图
const SWIPER = [{
        path: 'https://pic1.zhimg.com/80/v2-e360aaa63a493344ba2bdd7098387a95_720w.webp',
        text: 'JVM知识点'
    },
    {
        path: 'https://pic3.zhimg.com/v2-27e8f29e6eb257f6f65df007c6966f12.jpg',
        text: 'Java中的线程'
    },
    {
        path: 'https://pic3.zhimg.com/v2-d8e1c695f6f11a6ba6e1d9c465a541c6_r.jpg',
        text: 'Spring中的Bean对象'
    },
    {
        path: 'https://pic2.zhimg.com/v2-3a1fb23e19b2448033a9b7333941f465.jpg',
        text: 'Spring相关'
    },
]

// 关于页
const ABOUT = [{
        text: '免责声明',
        icon: DOMAIN + '/static/images/mz.svg',
        url: '/pages/nav/disclaimer/disclaimer'
    },
    {
        text: '友情链接',
        icon: DOMAIN + '/static/images/link.svg',
        url: '/pages/nav/friends/friends'
    },
    {
        text: '联系博主',
        icon: DOMAIN + '/static/images/email.svg',
        url: '/pages/nav/mine/mine'
    }
]

// 联系博主
const SOCIAL_LINK = [{
        text: '邮箱',
        icon: DOMAIN + '/static/images/email.png',
        url: '464817304@qq.com'
    },
    {
        text: '博客',
        icon: DOMAIN + '/static/images/blog.png',
        url: 'https://xmxe.gitee.io/blog'
    },
    {
        text: 'GitHub',
        icon: DOMAIN + '/static/images/github.png',
        url: 'https://github.com/xmxe'
    },
    {
        text: 'Gitee',
        icon: DOMAIN + '/static/images/gitee.png',
        url: 'https://gitee.com/xmxe'
    }
]

export default {
    getDomain: DOMAIN,
    getWebsiteName: WEBSITENAME,
    getIndexNav: INDEXNAV,
    getAuthorname: ARTICLE_AUTHOR_NAME,
    getAd: ISAD,
    getSwiper: SWIPER,
    getStaticImage: STATICIMAGE,
    getAboutList: ABOUT,
    getSocialLink: SOCIAL_LINK
}