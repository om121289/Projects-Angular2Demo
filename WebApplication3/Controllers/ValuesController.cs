using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplication3.SampleDB;

namespace WebApplication3.Controllers
{
    //[Authorize]
    public class ValuesController : ApiController
    {
        // GET api/values 
        public IEnumerable<Book> Getbooks()
        {
            using (testEntities entities=new testEntities())
            {
                //return entities.Books.AsEnumerable();
                var ls= entities.Books.ToList<Book>();                
                return ls;
            }
          
        }

        // GET api/values/5
        public IHttpActionResult Getbooks(int ById)
        {
            Book obj;
            //var found = Request.Headers.TryGetValues("Custom-Header", out values);
            using (testEntities entities = new testEntities())
            {
                obj = entities.Books.FirstOrDefault<Book>(b => b.ID == ById);
                //error
            }
            if (obj == null)
            {
                return NotFound();
            }
            return Ok(obj);
        }
        //[Route("api/GetbookByName")]
        //public IHttpActionResult Getbooks(string ById)
        //{
        //    Book obj;
        //    //var found = Request.Headers.TryGetValues("Custom-Header", out values);
        //    using (testEntities entities = new testEntities())
        //    {
        //        obj = entities.Books.FirstOrDefault<Book>(b => b.Name == ById);
        //        //error
        //    }
        //    if (obj == null)
        //    {
        //        return NotFound();
        //    }
        //    return Ok(obj);
        //}
       
        public IHttpActionResult Getbooks(int ById , string ByName)
        {
            Book obj;
            //var found = Request.Headers.TryGetValues("Custom-Header", out values);
            using (testEntities entities = new testEntities())
            {
                obj = entities.Books.FirstOrDefault<Book>(b => b.ID == ById);
                //error
            }
            if (obj == null)
            {
                return NotFound();
            }
            return Ok(obj);
        }
        //[Route("api/books/placebook")] // working url:'http://localhost:51141/placebook',
        //[HttpPost]
        //public IEnumerable<Book> Post(Book obj)
        //{
        //    using(testEntities entities=new testEntities())
        //    {
        //        Book objbook = new Book();

        //        objbook.Name = obj.Name;
        //        objbook.Age = obj.Age;
        //        entities.Books.Add(objbook);
        //        entities.SaveChanges();
        //       return Getbook();
        //    }
        //}


        // [ActionName("BookPost")]
        // [Route("api/books/placebook/test")]
        public IEnumerable<Book> Post(Book obj)
        {
            using (testEntities entities = new testEntities())
            {
                Book objbook = new Book();

                objbook.Name = obj.Name;
                objbook.Age = obj.Age;
                entities.Books.Add(objbook);
                entities.SaveChanges();
                return Getbooks();
            }
        }
        // PUT api/values/5
        [Route("api/books/placebook")] // working url:'http://localhost:51141/placebook'
        public IEnumerable<Book> Put(Book obj)
        {
            using (testEntities entities = new testEntities())
            {
                Book objbook = new Book();
                objbook = entities.Books.FirstOrDefault(b => b.ID == obj.ID);
                objbook.Name = obj.Name;
                objbook.Age = obj.Age;
                entities.SaveChanges();
            }
            return Getbooks();
        }

        // DELETE api/values/5
        public IEnumerable<Book> Delete(Book obj)
        {
            using (testEntities entities = new testEntities())
            {
                Book objbook = new Book();
                objbook = entities.Books.FirstOrDefault(b => b.Age == obj.Age);               
                entities.Books.Remove(objbook);
                entities.SaveChanges();             
            }
            return Getbooks();
        }
        
        //[HttpHeadAttribute]
        //public void head()
        //{
        //    string headValdue = "vinod";
        //}
    }
}
