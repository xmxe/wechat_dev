/**
 * 网站的请求接口
 */
import config from "../config/config";
// 请求地址
let Domain = config.getDomain;
module.exports = {
    // 获取文章的列表,参数介绍page
    getPostList(page) {
        return Domain + `/api/posts/${page}.json`;
    },
    // 获取轮播图文章
    getswiper() {
        return Domain + '/api/swiper.json'
    },
    // 获取指定的文章详情数据
    getArticleDetail(e) {
        return Domain + `/api/articles/${e}.json`
    },
    // 获取分类数据
    getCategories() {
        return Domain + '/api/categories.json'
    },
    // 获取标签数据
    getTags() {
        return Domain + '/api/tags.json'
    },
    // 获取指定的分类列表信息
    getCateDetail(CategorieName) {
        return Domain + `/api/categories/${CategorieName}.json`
    },
    // 获取指定的标签列表信息
    getTagDetail(TagName) {
        return Domain + `/api/tags/${TagName}.json`
    },
    // 获取搜索JSON数据
    getJsonSearch() {
        return Domain + '/api/search.json'
    },
    // 获取博客文章数据信息
    getPosts() {
        return Domain + '/api/posts.json'
    },
    // 获取一言JSON数据
    hitokoto() {
        return 'https://v1.hitokoto.cn'
    },
    // 获取友情链接数据
    friendsLink() {
        return Domain + '/download/assert/friends.json'
    }
}