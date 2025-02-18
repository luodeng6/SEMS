axios.get("").then(res => {
    if (res.data.result){

    }else{
      this.$message.error(res.data.msg)
    }
}).catch(err => {
    console.log(err)
    this.$message.error(err.message)
})