using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace QuanLyDangKyHocPhanSV.Models.Authentication
{
    public class AuthorizeRoleAttribute : ActionFilterAttribute
    {
        private readonly string _role;

        public AuthorizeRoleAttribute(string role)
        {
            _role = role;
        }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            var userRole = context.HttpContext.Session.GetString("Role");

            if (string.IsNullOrEmpty(userRole) || userRole != _role)
            {
                context.Result = new RedirectToRouteResult(
                    new RouteValueDictionary
                    {
                        { "Controller", "Home" },
                        { "Action", "Index" }
                    });
            }
        }
    }
}
