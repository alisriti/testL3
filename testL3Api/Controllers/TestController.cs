using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;

namespace testL3Api.Controllers
{
    [Route("monapi/traitement-text")]
    [ApiController]
    public class TestController : ControllerBase
    {
        [HttpGet]
        [Route("{texte}")]
        public IActionResult GetUpperCase(string texte)
        {
            if (texte is null)

                return Problem("Texte null");

            if (string.IsNullOrWhiteSpace(texte))
                return BadRequest("le texte est vide");

            return Ok(texte.ToUpper());
        }

        [HttpGet]
        [Route("/division/{a}/{b}")]
        public IActionResult division(int a, int b)
        {
            if (b == 0)
                return Problem("division par 0");

            return Ok(a / b);
        }

        [HttpPost]
        [Route("/methode-post/{nom}/{prenom}")]
        public IActionResult createNom(string nom, string prenom)
        {
            if (string.IsNullOrWhiteSpace(nom) || string.IsNullOrWhiteSpace(prenom))
            {
                return BadRequest("le nom ou le prenom sont vides");
            }

            string p1 = prenom.Substring(0, 1);
            string p2 = prenom.Substring(1);

            return Ok($"{nom.ToUpper()} {p1.ToUpper()}{p2.ToLower()}");
        }
    }
}