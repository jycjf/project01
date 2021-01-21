using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AjaxPro.Utility.RegisterTypeForAjax(typeof(login));

        UserName.Value = "manager";
        Password.Value = "123";
        if (!IsPostBack)   //注释
        {

        }

    }

    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.ReadWrite)]
    public string Userlogin(string UserName, string Password)
    {
        User me = new User();
        if (me.login(UserName.Trim(), Password.Trim()))
        {
            Session["useid"] = me.getUserID(UserName.Trim());       //得到用户id  

            string RoleName = me.getIsAdminByID(Session["useid"].ToString());

            if (me.getIsAdmin(UserName.Trim()) != "系统管理员")     //最高用户（可以直接登陆）
            {
                if (me.getExistControl(UserName.Trim())) //其他用户判断是否有权限
                {
                    return Session["useid"].ToString() + "|" + RoleName;
                }
                else
                    return "用户没权限";
            }
            else
                return Session["useid"].ToString() + "|" + RoleName;
        }
        else
            return "用户名或密码错误";
    }
}
