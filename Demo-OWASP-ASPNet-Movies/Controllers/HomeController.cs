using System.Linq;
using System.Web.Mvc;

namespace Demo_OWASP_ASPNet_Movies.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            Models.MoviesDBEntities db = new Models.MoviesDBEntities();

            Models.Users currentUser = db.Users1.Where(u => u.username == username & u.password == password).FirstOrDefault();

            if(currentUser != null)
            {
                return RedirectToAction("Index");
            }

            return RedirectToAction("Login");
        }


        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}