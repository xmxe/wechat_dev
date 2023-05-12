// 配置域名,域名只修改此处。可以配置为根域名 u.mr90.top/blog
const DOMAIN = "xmxe.gitee.io/blog";
// 网站名称
const WEBSITENAME = "熊猫小二";
// 微信鼓励的图片链接，用于个人小程序的赞赏
const ZANIMAGEURL = '../../static/images/zanshang.jpg';
// 网站的logo图片
const LOGO = "../../static/images/logo-icon.png";
// 文章作者的名称
const ARTICLE_AUTHOR_NAME = "xmxe";
// 文章作者的头像,这里是相对于文章页的地址
const ARTICLE_AUTHOR_img = "../../static/images/author.jpg";

const ISAD = {
    "enable": false,
    "bannerId": 'adunit-c9dae21126085de9'
}; // 是否开启广告

// 首页图标导航
const INDEXNAV = [{
        id: '1',
        // 'name'为名称
        name: '热门排行',
        // 'image'为图标路径
        image: '../../static/icon/index/1.png',
        // 'url'为跳转的页面
        url: '../hot/hot',
        // 'redirecttype'为跳转的类型
        // redirecttype是miniapp就是跳转其他小程序,url为其他小程序的页面
        // redirecttype为apppage就是跳转本小程序的页面,url为本小程序的页面路径
        // apppage为本小程序的页面,miniapp为其他微信小程序,webpage为web-view的页面
        redirecttype: 'apppage',
        // 'appid' 当redirecttype为miniapp时，这个值为其他微信小程序的appid，如果redirecttype为apppage、webpage时,这个值设置为空。
        appid: '',
        // 'extraData'当redirecttype为miniapp时，这个值为提交到其他微信小程序的参数，如果redirecttype为apppage、webpage时,这个值设置为空。
        extraData: ''
    },
    {
        id: '5',
        name: '搜索文章',
        image: '../../static/icon/index/2.png',
        url: '../search/search',
        redirecttype: 'apppage',
        appid: '',
        extraData: ''
    },
    {
        id: '7',
        name: '友情链接',
        image: '../../static/icon/index/3.png',
        url: '../feng/feng',
        redirecttype: 'apppage',
        appid: '',
        extraData: ''
    },
    {
        id: '10',
        name: '关于我们',
        image: '../../static/icon/index/4.png',
        url: '../about/about',
        redirecttype: 'apppage',
        appid: '',
        extraData: ''
    }
];

export default {
    getDomain: DOMAIN,
    getWebsiteName: WEBSITENAME,
    getIndexNav: INDEXNAV,
    getZanImageUrl: ZANIMAGEURL,
    getLogo: LOGO,
    getAuthorname: ARTICLE_AUTHOR_NAME,
    getAuthorImg: ARTICLE_AUTHOR_img,
    getAd: ISAD
}