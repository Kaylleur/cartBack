using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using log4net;
using testApi.Models;

namespace testApi.Controllers
{
    public class UsersController : ApiController
    {
        private static readonly ILog log = LogManager.GetLogger("Logger");
        private TestSalesEntities db = new TestSalesEntities();

        // GET api/Users
        public HttpResponseMessage Getusers()
        {
            try
            {
                return Request.CreateResponse(HttpStatusCode.OK, db.user.AsEnumerable());
            }
            catch (Exception e)
            {
                log.Error(e.InnerException.Message);
                if(log.IsDebugEnabled)log.Error(e.StackTrace);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.InnerException.Message);
            }
            
        }

        // GET api/Users/5
        public HttpResponseMessage Getuser(int id)
        {
            try
            {
                user user = db.user.Find(id);
                if (user == null)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "NOT_FOUND");
                }

                return Request.CreateResponse(HttpStatusCode.OK, user);
            }
            catch (Exception e)
            {
                log.Error(e.InnerException.Message);
                if (log.IsDebugEnabled) log.Error(e.StackTrace);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.InnerException.Message);
            }
        }

        // PUT api/Users/5
        public HttpResponseMessage Putuser(int id, user user)
        {
            if (ModelState.IsValid && id == user.id)
            {
                db.Entry(user).State = EntityState.Modified;

                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "NOT_FOUND");
                }

                return Request.CreateResponse(HttpStatusCode.OK,user);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest,"BAD_REQUEST");
            }
        }

        // POST api/Users
        public HttpResponseMessage Postuser(user user)
        {
            if (ModelState.IsValid)
            {
                db.user.Add(user);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, user);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = user.id }));
                return response;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest,"BAD_REQUEST");
            }
        }

        // DELETE api/Users/5
        public HttpResponseMessage Deleteuser(int id)
        {
            user user = db.user.Find(id);
            if (user == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "NOT_FOUND");
            }

            db.user.Remove(user);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "NOT_FOUND");
            }

            return Request.CreateResponse(HttpStatusCode.OK, user);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}