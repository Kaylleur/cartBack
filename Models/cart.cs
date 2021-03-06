//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.Collections;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using Newtonsoft.Json;

namespace testApi.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class cart
    {
        private TestSalesEntities db = new TestSalesEntities();

        public cart()
        {
            products = new HashSet<productCart>();
        }

        [Key]
        public int id { get; set; }
        [JsonIgnore]
        public int idUser { get; set; }
    
        [ForeignKey("idUser")]
        public virtual user user { get; set; }

        public virtual ICollection<productCart> products { get; set; }

    }
}
