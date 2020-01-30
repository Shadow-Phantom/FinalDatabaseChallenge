﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class yesHiEntities : DbContext
    {
        public yesHiEntities()
            : base("name=yesHiEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Client> Clients { get; set; }
        public virtual DbSet<Record> Records { get; set; }
        public virtual DbSet<Sale> Sales { get; set; }
        public virtual DbSet<Special_Passion> Special_Passion { get; set; }
        public virtual DbSet<database_firewall_rules> database_firewall_rules { get; set; }
    
        public virtual int ADD_CUSTOMER(Nullable<int> num, string name, string address, string postCode, string interest)
        {
            var numParameter = num.HasValue ?
                new ObjectParameter("num", num) :
                new ObjectParameter("num", typeof(int));
    
            var nameParameter = name != null ?
                new ObjectParameter("name", name) :
                new ObjectParameter("name", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("address", address) :
                new ObjectParameter("address", typeof(string));
    
            var postCodeParameter = postCode != null ?
                new ObjectParameter("postCode", postCode) :
                new ObjectParameter("postCode", typeof(string));
    
            var interestParameter = interest != null ?
                new ObjectParameter("interest", interest) :
                new ObjectParameter("interest", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ADD_CUSTOMER", numParameter, nameParameter, addressParameter, postCodeParameter, interestParameter);
        }
    }
}
