Component({
    options: {
        // 多个插槽
        multipleSlots: true
    },
    // 组件的属性列表
    properties: {
        color: { // 节点颜色
            type: String,
            value: "linear-gradient(26deg, #55AFF8 0%, #4E7FF0 100%)"
        },
        hollow: { // 节点是否空心点
            type: Boolean,
            value: true
        },
        size: { // 节点尺寸
            type: Number || String,
            value: "32"
        },
        lineColor: { // line颜色
            type: String,
            value: "#387CFF"
        },
        leftWidth: { // 轴左宽度
            type: String || Number,
            value: "356"
        },
        rightWidth: { // 轴右宽度
            type: String || Number,
            value: "356"
        }
    }
})