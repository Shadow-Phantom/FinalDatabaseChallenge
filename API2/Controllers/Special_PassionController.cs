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
    public class Special_PassionController : ApiController
    {
        private yesHiEntities db = new yesHiEntities();

        // GET: api/Special_Passion
        public IQueryable<Special_Passion> GetSpecial_Passion()
        {
            return db.Special_Passion;
        }

        // GET: api/Special_Passion/5
        [ResponseType(typeof(Special_Passion))]
        public IHttpActionResult GetSpecial_Passion(string id)
        {
            Special_Passion special_Passion = db.Special_Passion.Find(id);
            if (special_Passion == null)
            {
                return NotFound();
            }

            return Ok(special_Passion);
        }

        // PUT: api/Special_Passion/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSpecial_Passion(string id, Special_Passion special_Passion)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != special_Passion.PassionCode)
            {
                return BadRequest();
            }

            db.Entry(special_Passion).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Special_PassionExists(id))
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

        // POST: api/Special_Passion
        [ResponseType(typeof(Special_Passion))]
        public IHttpActionResult PostSpecial_Passion(Special_Passion special_Passion)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Special_Passion.Add(special_Passion);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (Special_PassionExists(special_Passion.PassionCode))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = special_Passion.PassionCode }, special_Passion);
        }

        // DELETE: api/Special_Passion/5
        [ResponseType(typeof(Special_Passion))]
        public IHttpActionResult DeleteSpecial_Passion(string id)
        {
            Special_Passion special_Passion = db.Special_Passion.Find(id);
            if (special_Passion == null)
            {
                return NotFound();
            }

            db.Special_Passion.Remove(special_Passion);
            db.SaveChanges();

            return Ok(special_Passion);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Special_PassionExists(string id)
        {
            return db.Special_Passion.Count(e => e.PassionCode == id) > 0;
        }
    }
}