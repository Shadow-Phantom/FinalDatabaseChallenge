//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace API2.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Sale
    {
        public int ClientNum { get; set; }
        public string CdID { get; set; }
        public System.DateTime SaleDate { get; set; }
        public decimal PricePaid { get; set; }
    
        public virtual Client Client { get; set; }
        public virtual Record Record { get; set; }
    }
}
