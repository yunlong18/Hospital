<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>意见反馈</title>
    <script type="text/javascript" src="../../portal/js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../portal/css/global_x.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/lyc_x.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/slick.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/page.css">
    <link rel="stylesheet" type="text/css" href="../../portal/css/footer.css">
</head>
<body>
<jsp:include page="header1.jsp"></jsp:include>
<div class="body_box apppage" style="min-height: 64px;">
    <div class="position">
        <div class="block">您现在的位置：
            <a href="${pageContext.request.contextPath}/portal/index.html">首页</a>
             &gt; <a href="javascript:void(0);" onclick="window.location.reload()">意见反馈</a>
        </div>
    </div>
    <div class="tabs_box" id="datalist">
        <div class="block">
            <div class="tbright">
                <form id="myForm">
                    <div class="inner">
                        <div class="part1">
                            <div class="input">
                                <input type="text" id="name" name="name" placeholder="反馈人">
                            </div>
                            <div class="input">
                                <input type="text" id="phone" name="phone" placeholder="手机号">
                            </div>
                        </div>
                        <div class="part2">
                            <div class="textare">
                                <textarea name="content" id="content"
                                    placeholder="反馈意见"></textarea>
                            </div>
                        </div>
                        <div class="button" id="submit">
                            <a href="javascript:void(0);" onclick="commitMessage()">确认提交</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</form>

<script type="text/javascript">
    function commitMessage() {
        var name = $("#name").val();
        var phone = $("#phone").val();
        var content = $("#content").val();
        if (name == "" || phone == "" || content == ""){
            alert("请将信息填写完整");
            return ;
        }
        $.post("${pageContext.request.contextPath}/user/commitMessage.action",
            $("#myForm").serialize(),
            function (data) {
                if (data.status == 200) {
                    alert("提交成功");
                } else {
                    alert(data.msg);
                }
            },
            "json"
        )
    }
</script>
</body>
</html>
