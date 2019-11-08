using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Demo_OWASP_ASPNet_Movies.Controllers
{
    public class HomeController : Controller
    {
        string connectionString = "Server=database-downloadmovies.cuit7donrxwm.us-east-1.rds.amazonaws.com,1433;Database=MoviesDB;User Id=awsdemovies; Password=aws.1234;";

        Models.MoviesDBEntities db = new Models.MoviesDBEntities();

        public ActionResult Index()
        {
            List<Models.MovieView> myMovies = new List<Models.MovieView>();

            HttpCookie myCK = Request.Cookies["LoggedCookie"];

            if (myCK.Value != "true") {
                return RedirectToAction("Login");           
            }
            else
            {
                HttpCookie myIdUserCK = Request.Cookies["UserIdCookie"];
                if (TempData["searchResult"] != null)
                {
                    return View(TempData["searchResult"]);
                }

                int idU = Convert.ToInt32(myIdUserCK.Value);

                string sql = "select distinct M.idMovie, C.category, M.title, M.release ";
                sql += "from Movies M inner join Categories C on M.idCategory = C.idCategory ";
                sql += "inner join Subscriptions S on C.idCategory = S.idCategory ";
                sql += "where S.idUser = " + idU;
                
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(sql, connection);
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            Models.MovieView mv = new Models.MovieView();
                            mv.IdMovie = Convert.ToInt32(reader[0].ToString());
                            mv.Category = reader[1].ToString();
                            mv.Title = reader[2].ToString();
                            mv.ReleaseYear = Convert.ToInt32(reader[3].ToString());

                            myMovies.Add(mv);
                        }
                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine(ex.Message);
                    }
                }
            }
            
            return View(myMovies);
        }

        public ActionResult Login()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            Models.Users currentUser = db.Users1.Where(u => u.username == username & u.password == password).FirstOrDefault();

            if(currentUser != null)
            {
                HttpCookie userIdCK = new HttpCookie("UserIdCookie");
                HttpCookie myCookieUser = new HttpCookie("LoggedCookie");
                HttpCookie userAuth = new HttpCookie("userAuthCookie");
                                
                userIdCK.Value = currentUser.idUser.ToString();
                myCookieUser.Value = "true";
                userAuth.Value = "false";

                Response.Cookies.Add(userIdCK);
                Response.Cookies.Add(myCookieUser);
                Response.Cookies.Add(userAuth);

                return RedirectToAction("Index");
            }

            return RedirectToAction("Login");
        }

        [HttpPost]
        public ActionResult Search(string criteria)
        {
            List<Models.MovieView> myMovies = new List<Models.MovieView>();

            HttpCookie myIdUserCK = Request.Cookies["UserIdCookie"];
            int idU = Convert.ToInt32(myIdUserCK.Value);

                string sql = "select distinct M.idMovie, C.category, M.title, M.release ";
                sql += "from Movies M inner join Categories C on M.idCategory = C.idCategory ";
                sql += "inner join Subscriptions S on C.idCategory = S.idCategory ";
                sql += "where S.idUser = " + idU + " and M.title like '%" + criteria + "%'";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(sql, connection);
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            Models.MovieView mv = new Models.MovieView();
                            mv.IdMovie = Convert.ToInt32(reader[0].ToString());
                            mv.Category = reader[1].ToString();
                            mv.Title = reader[2].ToString();
                            mv.ReleaseYear = Convert.ToInt32(reader[3].ToString());

                            myMovies.Add(mv);
                        }
                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine(ex.Message);
                    }
            }

            TempData["searchResult"] = myMovies;

            return RedirectToAction("Index");
        }

        public ActionResult Logout()
        {
            HttpCookie myCookieUser = new HttpCookie("LoggedCookie");
            myCookieUser.Value = "false";
            Response.Cookies.Add(myCookieUser);

            return RedirectToAction("Login");
        }

        public ActionResult Administration()
        {
            HttpCookie userAuth = Request.Cookies["userAuthCookie"];

            if (userAuth.Value != "true")
            {
                ViewBag.Message = "You do not have enough privileges!";
                return View("Error");
            }
            
            ViewBag.Message = "Welcome Administrator!";

            return View();
        }
    }
}