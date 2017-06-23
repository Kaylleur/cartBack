using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using log4net;
using Newtonsoft.Json;
using System.Security.Principal;
using System.Web;
using testApi.Models;
using testApi.Requests;
using testApi.Responses;

namespace testApi.Controllers
{
    public class SessionController : ApiController
    {
        private static readonly ILog log = LogManager.GetLogger("Logger");
        private TestSalesEntities db = new TestSalesEntities();

        [HttpPost]
        [Route("session")]
        public HttpResponseMessage signIn(SignInRequest request)
        {
           try
            {
                var user = db.user.FirstOrDefault(u => (u.name == request.name && u.password == request.password));
                if (user == null)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "NOT_FOUND");
                }
               var tokenResponse = new TokenResponse(user).generateToken();

                return Request.CreateResponse(HttpStatusCode.OK, new {token = tokenResponse.token});
            }
            catch (Exception e)
            {
                log.Error(e.Message);
                if (log.IsDebugEnabled) log.Error(e.StackTrace);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.Message);
            }

        }

        [Route("session/windowsAuthentication/")]
        [HttpGet]
        public HttpResponseMessage connectAutomaticaly()
        {
            try
            {
                var identity = (WindowsIdentity)HttpContext.Current.User.Identity;
                if (identity.Name == "")
                {
                    return Request.CreateErrorResponse(HttpStatusCode.Unauthorized, "USER NOT CORRECTLY IDENTIFIED");
                }
                return Request.CreateResponse(HttpStatusCode.OK, new { username = identity.Name });

            }
            catch (Exception e)
            {
                log.Error(e.Message);
                if (log.IsDebugEnabled) log.Error(e.StackTrace);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.Message);
            }
        }


        [Route("session")]
        [HttpGet]
        public HttpResponseMessage checkToken()
        {
            try
            {
                var headers = Request.Headers.GetValues("access-token");
                var token = headers.FirstOrDefault();
                string stringPayload = JWT.JsonWebToken.Decode(token, TokenResponse.SecretKey);
                var jsonPayload = JsonConvert.DeserializeObject(stringPayload);
                return Request.CreateResponse(HttpStatusCode.OK,  jsonPayload );

            }
            catch (Exception e)
            {
                log.Error(e.Message);
                if (log.IsDebugEnabled) log.Error(e.StackTrace);
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e.Message);
            }
        }
    }
}
