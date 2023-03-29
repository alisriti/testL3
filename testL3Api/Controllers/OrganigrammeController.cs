using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using testL3Api.Managers;
using testL3Api.Models;
using testL3Api.Services;

namespace testL3Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrganigrammeController : ControllerBase
    {
        private OrgaService orgaService;

        public OrganigrammeController(IConfiguration configuration)
        {
            orgaService = new OrgaService(configuration);
        }

        [HttpGet, Route("/facultes")]
        public IActionResult GetFacultes()
        {
            List<Faculte> result = orgaService.GetFacultes();
            if (result is null)
                return NotFound();
            return Ok(result);
        }

        [HttpGet, Route("/facultes/{code}")]
        public IActionResult GetFaculte(string code)
        {
            Faculte result = orgaService.GetFaculte(code);
            if (result is null)
                return NotFound();
            return Ok(result);
        }
    }
}