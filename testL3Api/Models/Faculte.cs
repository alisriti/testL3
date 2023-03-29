using System.Collections.Generic;

namespace testL3Api.Models
{
    public class Faculte
    {
        public string Code { get; set; }
        public string Nom { get; set; }
        public List<Departement> Departements { get; set; }

        public Faculte()
        {
            Departements = new List<Departement>();
        }
    }
}