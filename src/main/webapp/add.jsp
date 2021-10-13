<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/add" method="post">
        <table>
            <tr>
                <td><h2>园区门禁管理系统</h2></td>
            </tr>
            <tr>
                <td>负责人(*)</td>
                <td>
                    <input type="text" name="principal" id="principal" />
                </td>
            </tr>
            <tr>
                <td>供货商(*)</td>
                <td>
                    <input type="text" name="supplier" id="supplier" />
                </td>
            </tr>
            <tr>
                <td>品牌(*)</td>
                <td>
                    <input type="text" name="brand" id="brand" />
                </td>
            </tr>
            <tr>
                <td>所属楼宇(*)</td>
                <td>
                    <select name="hospital_id" id="hospital_id">

                    </select>
                </td>
            </tr>
            <tr>
                <td>安装日期(*)</td>
                <td>
                    <input type="text" name="add_time" id="add_time" />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="添加">
                    <input type="button" value="返回" onclick="fan()">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
<script src="statics/jquery-1.12.4.js"></script>
<script type="text/javascript">
    $(function () {
        show()
    })

    function show() {
        var d1=$("#d1").val();
        $.ajax({
            url:"/show",
            dateType:"json",
            success:function (result) {
                var select="";
                select+="<option value='-1'>"+"全部"+"</option>";
                for (var i=0;i<result.length;i++){
                        select+="<option value='"+result[i].id+"' >"+result[i].name+"</option>";
                }
                $("#hospital_id").append(select);
            }
        })
    }

    function fan() {
        location.href="index.jsp";
    }
    $("form").submit(function () {
        var principal=$("#principal").val();
        if (principal==""){
            alert("请填写完整的门禁设备信息");
            return false;
        }
        var supplier=$("#supplier").val();
        if (supplier==""){
            alert("请填写完整的门禁设备信息");
            return false;
        }
        var brand=$("#brand").val();
        if (brand==""){
            alert("请填写完整的门禁设备信息");
            return false;
        }
        var hospital_id=$("#hospital_id").val();
        if (hospital_id=="-1"){
            alert("请填写完整的门禁设备信息");
            return false;
        }
        var add_time=$("#add_time").val();
        var regadd=/^\d{4}-\d{2}-\d{2}$/;
        if (regadd.test(add_time)==false){
            alert("日期格式不正确");
            return false;
        }
        return true;
    });

</script>
