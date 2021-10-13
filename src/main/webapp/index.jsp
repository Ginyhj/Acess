<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>园区门禁管理系统</h1>
    <div id="div">
        <form action="/page" method="post">
            <input type="hidden" name="pageIndex" id="pageIndex" value="1"/>

            <select name="hospital_id" id="hospital_id">
            </select>
            <input type="hidden" id="d1" value="${param.hospital_id}"/>
            <input type="submit" value="查询">
            <input type="button" value="添加" onclick="toadd()">
        </form>
    </div>
    <table border="1">
        <tr>
            <td>负责人</td>
            <td>供货商</td>
            <td>品牌</td>
            <td>所属楼宇</td>
            <td>安装日期</td>
            <td>运行状态</td>
            <td>操作</td>
        </tr>
        <c:forEach var="p" items="${page.list}">
            <tr>
                <td>${p.principal}</td>
                <td>${p.supplier}</td>
                <td>${p.brand}</td>
                <td>${p.name}</td>
                <td>${p.add_time}</td>
                <td><a href="#">${p.status==0?"禁用":"启用"}</a></td>
                <td>
                    <c:if test="${p.status==0}">
                        <a href="#" onclick="">启用</a>
                    </c:if>
                    <c:if test="${p.status==1}">
                        <a href="#" onclick="del(${p.id},this)">禁用</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>

    </table>
<div>
    <div>
        <c:if test="${page.pageIndex>1}">
            <a href="javascript:toPage(1)">首页</a>
            <a href="javascript:toPage(${page.pageIndex-1})">上一页</a>

        </c:if>
        <c:if test="${page.pageIndex<page.pageCount}">
            <a href="javascript:toPage(${page.pageIndex+1})">下一页</a>
            <a href="javascript:toPage(${page.pageCount})">末页</a>
        </c:if>
        第${page.pageIndex}页/第${page.pageCount}页
    </div>
</div>
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
                    if (result[i].id==d1){
                        select+="<option value='"+result[i].id+"' selected >"+result[i].name+"</option>";
                    } else{
                        select+="<option value='"+result[i].id+"' >"+result[i].name+"</option>";
                    }

                }
                $("#hospital_id").append(select);
            }
        })
    }

    function toPage(pageIndex) {
        $("#pageIndex").val(pageIndex);
        $("form").submit();
    }
    $("table  tr:even").css("background","Aqua");
    $("table  tr:odd").css("background","Cyan");
    $("table  tr:first").css("background","Aquamarine");

    function toadd() {
        location.href="add.jsp";
    }


    function del(id,e) {
        if (confirm("是否确实停用改设备")){
            $.ajax({
                url:"/update",
                data:"id="+id,
                success:function (result) {
                    if (result=="ok") {
                        $(e).html("停用");

                    }
                }
            })
        }
    }
</script>