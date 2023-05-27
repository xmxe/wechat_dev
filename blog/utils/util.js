const formatTime = date => {
    const year = date.getFullYear()
    const month = date.getMonth() + 1
    const day = date.getDate()
    const hour = date.getHours()
    const minute = date.getMinutes()
    const second = date.getSeconds()
    return `${[year, month, day].map(formatNumber).join('/')} ${[hour, minute, second].map(formatNumber).join(':')}`
}

const timeChage = res => {
    if (!res) {
        return '-';
    }
    let date2 = new Date(res);
    let year = date2.getFullYear();
    let mon = formatFunc(date2.getMonth() + 1);
    let day = formatFunc(date2.getDate());
    let hour = date2.getHours();
    //let noon = hour >= 12 ? 'PM' : 'AM'; 
    hour = hour >= 12 ? hour : hour;
    //hour = hour >= 12 ? hour - 12 : hour; 
    hour = formatFunc(hour);
    let min = formatFunc(date2.getMinutes());
    let sec = formatFunc(date2.getSeconds());
    let dateStr = year + '.' + mon + '.' + day + ' ' + hour + ':' + min;
    return dateStr;
}
// 一言
const hitokoto = (that, wxRequest, url) => {
    wxRequest.getRequest(url).then(res => {
        let hitokoto = res.data.hitokoto;
        let i = 0;
        clearInterval(timer)
        let timer = setInterval(() => {
            that.setData({
                text: hitokoto.substring(0, i)
            });
            i++;
            if (that.data.text === hitokoto) {
                clearInterval(timer)
            }
        }, 150)
    })
}
const clipboard = data => {
    // 设置剪切板的内容
    wx.setClipboardData({
        data
    })
}

module.exports = {
    formatTime,
    hitokoto,
    timeChage,
    clipboard
}