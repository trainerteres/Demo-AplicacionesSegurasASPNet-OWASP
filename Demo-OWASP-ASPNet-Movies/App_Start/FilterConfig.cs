using System.Web;
using System.Web.Mvc;

namespace Demo_OWASP_ASPNet_Movies
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
