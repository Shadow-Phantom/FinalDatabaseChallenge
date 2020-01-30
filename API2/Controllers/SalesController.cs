using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using API2.Models;

namespace API2.Controllers
{
    public class SalesController : ApiController
    {
        private yesHiEntities db = new yesHiEntities();

        // GET: api/Sales
        public IQueryable<Sale> GetSales()
        {
            return db.Sales;
        }

        // GET: api/Sales/5
        [ResponseType(typeof(Sale))]
        public IHttpActionResult GetSale(int id)
        {
            Sale sale = db.Sales.Find(id);
            if (sale == null)
            {
                return NotFound();
            }

            return Ok(sale);
        }

        // PUT: api/Sales/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSale(int id, Sale sale)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != sale.ClientNum)
            {
                return BadRequest();
            }

            db.Entry(sale).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SaleExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Sales
        [ResponseType(typeof(Sale))]
        public IHttpActionResult PostSale(Sale sale)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Sales.Add(sale);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (SaleExists(sale.ClientNum))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = sale.ClientNum }, sale);
        }

        // DELETE: api/Sales/5
        [ResponseType(typeof(Sale))]
        public IHttpActionResult DeleteSale(int id)
        {
            Sale sale = db.Sales.Find(id);
            if (sale == null)
            {
                return NotFound();
            }

            db.Sales.Remove(sale);
            db.SaveChanges();

            return Ok(sale);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SaleExists(int id)
        {
            return db.Sales.Count(e => e.ClientNum == id) > 0;
        }
    }
}