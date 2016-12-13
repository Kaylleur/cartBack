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
    public class CartsController : ApiController
    {
        private static readonly ILog log = LogManager.GetLogger("Logger");
        private TestSalesEntities db = new TestSalesEntities();

        // GET api/Carts
        public HttpResponseMessage Getcarts()
        {
            try
            {
                var cart = db.cart.Include(c => c.user);
                return Request.CreateResponse(HttpStatusCode.OK, cart.AsEnumerable());
            }
            catch (Exception e)
            {
                log.Error(e.InnerException.Message);
                if (log.IsDebugEnabled) log.Error(e.StackTrace);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.InnerException.Message);
            }
            
        }

        // GET api/Carts/5
        public HttpResponseMessage Getcart(int id)
        {
            try
            {
                cart cart = db.cart.Find(id);
                if (cart == null)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "NOT_FOUND");
                }

                return Request.CreateResponse(HttpStatusCode.OK, cart);
            }
            catch (Exception e)
            {
                log.Error(e.InnerException.Message);
                if (log.IsDebugEnabled) log.Error(e.StackTrace);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.InnerException.Message);
            }
        }

        // PUT api/Carts/5
        public HttpResponseMessage Putcart(int id, cart cart)
        {
            if (ModelState.IsValid && id == cart.id)
            {
                db.Entry(cart).State = EntityState.Modified;

                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound,"NOT_FOUND");
                }

                return Request.CreateResponse(HttpStatusCode.OK,cart);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest,"BAD_REQUEST");
            }
        }

        // POST api/Carts
        public HttpResponseMessage Postcart(cart cart)
        {
            if (ModelState.IsValid)
            {
                db.cart.Add(cart);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, cart);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = cart.id }));
                return response;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest,"BAD_REQUEST");
            }
        }

        // DELETE api/Carts/5
        public HttpResponseMessage Deletecart(int id)
        {
            cart cart = db.cart.Find(id);
            if (cart == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound,"NOT_FOUND");
            }

            db.cart.Remove(cart);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound,"NOT_FOUND");
            }

            return Request.CreateResponse(HttpStatusCode.OK, cart);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}