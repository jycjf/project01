<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="Default/css/login.css" />
    <link rel="stylesheet" href="Default/font-awesome-4.7.0/css/font-awesome.css" />
    <link rel="stylesheet" href="Default/font-awesome-4.7.0/css/font-awesome.min.css" />
    <script type="text/javascript" src="default/js/jquery-1.8.0.min.js   "></script>
    <script type="text/javascript" src="default/js/index.js   "></script>
    <title>企业管理信息系统</title>
</head>
<script>
    function CheckFrom() {

        //var value = EMIS.F_Login3.GetResult("李四").value;
        //alert(value);

        //alert("TEST");
        //var res=F_Login.Test1();
        //alert(res.value);
        if (document.getElementById("UserName").value.trim() == '') {
            alert("用户名不能为空");
            return false;
        }
        else if (document.getElementById("Password").value.trim() == '') {
            alert("密码不能为空");
            return false;
        }
        else {
            login.Userlogin(document.getElementById("UserName").value, document.getElementById("Password").value, function (result) {
                if (result.value == "用户没权限") alert("用户没权限");
                else if (result.value == "用户名或密码错误") alert("用户名或密码错误");
                else {
                    //var arry = result.value.split("|");
                    //if (QueryString("Application")) {
                        //window.location.href = "HomePage.aspx?useid=" + arry[0] + "&roleName=" + encodeURIComponent(arry[1]);
                        window.location.href = "HomePage.aspx";
                    //}
                    //else {
                    //    //window.location.href = "Default.aspx";
                    //    window.location.href = "HomePage.aspx?useid=" + arry[0] + "&roleName=" + encodeURIComponent(arry[1]);
                    //    //window.open("HomePage.aspx?useid=" + arry[0] + "&roleName=" + encodeURIComponent(arry[1]), '_blank', 'top=0,left=0,height=' + (window.screen.height - 80) + ', width=' + (window.screen.width - 10) + ',toolbar=no, menubar=no,scrollbars=no,resizable=yes,location=no,status=yes');
                    //    window.setTimeout(function () {
                    //        window.opener = null; window.close();
                    //    }, 1000);
                    //}
                }
            });
        }


    };

</script>
<body>
    <form id="form1" runat="server">
        <div id="login-box">
            <h1>Login</h1>
            <div class="form">
                <div class="item">
                    <!-- <i class="fa fa-user-circle-o" aria-hidden="true"></i>-->
                    <input id="UserName" runat="server" name="UserName" type="text" placeholder="Username" />

                </div>
                <div class="item">
                    <!--  <div id="item1">-->
                    <!-- <i class="fa fa-key" aria-hidden="true"></i>-->
                    <input id="Password" runat="server" name="Password" type="text" placeholder="Password" />
                </div>
            </div>
            <div class="Login">
                <input id="ButLogin" type="button" onclick="CheckFrom();" value="login" />
                <!--<button>login</button>-->
            </div>
        </div>
    </form>
</body>
</html>
