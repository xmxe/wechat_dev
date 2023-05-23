const hitokoto = (that,wxRequest,url) => {
    wxRequest.getRequest(url).then(res=>{
        let hitokoto = res.data.hitokoto;
        let i = 0;
        clearInterval(timer)
        let timer = setInterval(()=>{
            that.setData({
                text: hitokoto.substring(0, i)
            });
            i++;
            if (that.data.text === hitokoto) {
                clearInterval(timer)
            }
        },150)
    })
}

module.exports = {
    hitokoto
}