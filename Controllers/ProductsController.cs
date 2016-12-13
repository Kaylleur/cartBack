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
    public class ProductsController : ApiController
    {
        private static readonly ILog log = LogManager.GetLogger("Logger");
        private TestSalesEntities db = new TestSalesEntities();

        // GET api/Product
        public HttpResponseMessage Getproducts()
        {
            try
            {
                return Request.CreateResponse(HttpStatusCode.OK, db.product.AsEnumerable());
            }
            catch (Exception e)
            {
                log.Error(e.InnerException.Message);
                if (log.IsDebugEnabled) log.Error(e.StackTrace);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.InnerException.Message);
            }
        }

        // GET api/Product/5
        public HttpResponseMessage Getproduct(int id)
        {
            try
            {
                product products = db.product.Find(id);
                if (products == null)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "NOT_FOUND");
                }

                return Request.CreateResponse(HttpStatusCode.OK, products);
            }
            catch (Exception e)
            {
                log.Error(e.InnerException.Message);
                if (log.IsDebugEnabled) log.Error(e.StackTrace);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.InnerException.Message);
            }
        }

        // PUT api/Product/5
        public HttpResponseMessage Putproduct(int id, product product)
        {
            if (ModelState.IsValid && id == product.id)
            {
                db.Entry(product).State = EntityState.Modified;

                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "NOT_FOUND");
                }

                return Request.CreateResponse(HttpStatusCode.OK,product);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "BAD_REQUEST");
            }
        }

        // POST api/Product
        public HttpResponseMessage Postproduct(product product)
        {
            if (ModelState.IsValid)
            {
                db.product.Add(product);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, product);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = product.id }));
                return response;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "BAD_REQUEST");
            }
        }

        // DELETE api/Product/5
        public HttpResponseMessage Deleteproduct(int id)
        {
            product product = db.product.Find(id);
            if (product == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "NOT_FOUND");
            }

            db.product.Remove(product);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "NOT_FOUND");
            }

            return Request.CreateResponse(HttpStatusCode.OK, product);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}