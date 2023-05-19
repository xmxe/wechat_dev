// components/Tabs.js
Component({
    /**
     * 里面存放的是 要从父组件中接收的数据
     */
    properties: {
        // 要接收的数据的名称
        // text:{
        // 要接收的数据的类型 
        //   type:String,
        // 默认值
        //   value:""
        // }
        tabs: {
            type: Array,
            value: []
        }
    },

    /**
     * 组件的初始数据
     */
    data: {
        // tabs
    },
    /* 
     * 1 页面.js 文件中 存放事件回调函数的时候 存放在data同层级下！！！
     * 2 组件.js 文件中 存放事件回调函数的时候 必须要存在在methods中！！！
     */
    methods: {
        hanldeItemTap(e) {
            /* 
             * 1 绑定点击事件 需要在methods中绑定
             * 2 获取被点击的索引 
             * 3 获取原数组 
             * 4 对数组循环(1)给每一个循环性选中属性改为false(2)给当前的索引的项添加激活选中效果就可以了
             * 5 点击事件触发的时候触发父组件中的自定义事件 同时传递数据给父组件 this.triggerEvent("父组件自定义事件的名称",要传递的参数)
             */

            // 获取索引
            const {
                index
            } = e.currentTarget.dataset;
            // 触发父组件中的自定义事件 同时传递数据给  
            this.triggerEvent("itemChange", {
                index
            });
            // 获取data中的数组
            // 解构 对复杂类型进行结构的时候复制了一份变量的引用而已
            // 最严谨的做法 重新拷贝一份数组，再对这个数组的备份进行处理，
            // let tabs=JSON.parse(JSON.stringify(this.data.tabs));
            // 不要直接修改this.data.数据 
            // let {tabs}=this.data;
            // let tabs=this.data;
            // 循环数组
            // [].forEach 遍历数组 遍历数组的时候修改了v，也会导致源数组被修改
            // tabs.forEach((v,i)=>i===index?v.isActive=true:v.isActive=false);

            // this.setData({
            // tabs
            // })
        }
    }
})