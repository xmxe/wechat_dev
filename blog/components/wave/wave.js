Component({
    /**
     * 组件的属性列表
     */
    properties: {},

    /**
     * 组件的初始数据
     */
    data: {
        isShowInfo: false
    },

    /**
     * 组件的方法列表
     */
    methods: {
        hideInfo: function () {
            this.setData({
                isShowInfo: true
            })
        }
    }
})