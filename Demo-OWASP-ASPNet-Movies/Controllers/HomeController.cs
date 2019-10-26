using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Mvc;

namespace Demo_OWASP_ASPNet_Movies.Controllers
{
    public class HomeController : Controller
    {
        string connectionString = "Server=localhost;Database=MoviesDB;User Id=sa; Password=masterKey;";

        Models.MoviesDBEntities db = new Models.MoviesDBEntities();

        public ActionResult Index()
        {
            List<Models.MovieView> myMovies = new List<Models.MovieView>();

            if (Session["logged"] == null || (Convert.ToInt32(Session["logged"].ToString()) != 1))
            {
                return RedirectToAction("Login");
            }
            else
            {
                if(TempData["searchResult"] != null)
                {
                    return View(TempData["searchResult"]);
                }

                int idU = Convert.ToInt32(Session["userId"].ToString());

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
                Session["userId"] = currentUser.idUser;
                Session["logged"] = 1;
                return RedirectToAction("Index");
            }

            return RedirectToAction("Login");
        }

        [HttpPost]
        public ActionResult Search(string criteria)
        {
            List<Models.MovieView> myMovies = new List<Models.MovieView>();


                int idU = Convert.ToInt32(Session["userId"].ToString());

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