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
                log.Error(e.Message);
                if (log.IsDebugEnabled) log.Error(e.StackTrace);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.Message);
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
                log.Error(e.Message);
                if (log.IsDebugEnabled) log.Error(e.StackTrace);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.Message);
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
            return Request.CreateErrorResponse(HttpStatusCode.BadRequest,"BAD_REQUEST");
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


        [HttpGet]
        [Route("carts/users/{idUser}")]
        public HttpResponseMessage GetUserCarts(int idUser)
        {
            try
            {
                var carts = db.cart.Where(c => c.idUser == idUser).AsEnumerable();

                return Request.CreateResponse(HttpStatusCode.OK, carts);
            }
            catch (Exception e)
            {
                log.Error(e.Message);
                if (log.IsDebugEnabled) log.Error(e.StackTrace);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.Message);
            }
        }

        //MANAGEMENT OF PRODUCT CARTS

        //ADD
        [HttpPost]
        public HttpResponseMessage AddProductCart(productCart productCart)
        {
            if (ModelState.IsValid)
            {
                db.productCart.Add(productCart);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, productCart);
                return response;
            }
            return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "BAD_REQUEST");
            
        }

        //DELETE
        [HttpDelete]
        [Route("carts/{idCart}/product/{idProduct}")]
        public HttpResponseMessage RemoveProductCart(int idCart, int idProduct)
        {
            productCart productCart = db.productCart.FirstOrDefault(p => (p.idCart == idCart && p.idProduct == idProduct));
            if (productCart == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "NOT_FOUND");
            }

            db.productCart.Remove(productCart);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "NOT_FOUND");
            }

            return Request.CreateResponse(HttpStatusCode.OK, productCart);
        }





        //OVERRIDE

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}