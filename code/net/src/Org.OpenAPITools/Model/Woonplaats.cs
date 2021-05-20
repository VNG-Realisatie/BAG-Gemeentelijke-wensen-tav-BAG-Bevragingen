/*
 * Huidige bevragingen API
 *
 * Deze API levert actuele gegevens over adressen, adresseerbare objecten en panden. Actueel betekent in deze API `zonder eindstatus`. De bron voor deze API is de basisregistratie adressen en gebouwen (BAG).
 *
 * The version of the OpenAPI document: 1.1.0
 * Contact: bag@kadaster.nl
 * Generated by: https://github.com/openapitools/openapi-generator.git
 */

using System;
using System.Linq;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Runtime.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.ComponentModel.DataAnnotations;
using OpenAPIDateConverter = Org.OpenAPITools.Client.OpenAPIDateConverter;

namespace Org.OpenAPITools.Model
{
    /// <summary>
    /// Een woonplaats is een gedeelte van het grondgebied van de gemeente met een naam.
    /// </summary>
    [DataContract]
    public partial class Woonplaats :  IEquatable<Woonplaats>, IValidatableObject
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="Woonplaats" /> class.
        /// </summary>
        /// <param name="identificatie">identificatie.</param>
        /// <param name="domein">Het domein waartoe de identificatie behoort..</param>
        /// <param name="naam">De naam van de woonplaats..</param>
        /// <param name="status">status.</param>
        /// <param name="geconstateerd">Indicator dat de woonplaats in de registratie is opgenomen door een feitelijke constatering, zonder dat er een brondocument aan ten grondslag ligt. De woonplaats is mogelijk illegaal..</param>
        /// <param name="documentdatum">De vaststellingsdatum van het brondocument dat de basis is voor opname, wijziging of een verwijdering van een object..</param>
        /// <param name="documentnummer">De unieke aanduiding van het brondocument op basis waarvan een opname, mutatie of een verwijdering van gegevens ten aanzien van een woonplaats heeft plaatsgevonden, binnen een gemeente. Alle karakters uit de MES-1 karakterset zijn toegestaan..</param>
        /// <param name="mogelijkOnjuist">mogelijkOnjuist.</param>
        public Woonplaats(string identificatie = default(string), string domein = default(string), string naam = default(string), StatusWoonplaatsEnum status = default(StatusWoonplaatsEnum), bool geconstateerd = default(bool), DateTime documentdatum = default(DateTime), string documentnummer = default(string), WoonplaatsMogelijkOnjuist mogelijkOnjuist = default(WoonplaatsMogelijkOnjuist))
        {
            this.Identificatie = identificatie;
            this.Domein = domein;
            this.Naam = naam;
            this.Status = status;
            this.Geconstateerd = geconstateerd;
            this.Documentdatum = documentdatum;
            this.Documentnummer = documentnummer;
            this.MogelijkOnjuist = mogelijkOnjuist;
        }

        /// <summary>
        /// Gets or Sets Identificatie
        /// </summary>
        [DataMember(Name="identificatie", EmitDefaultValue=false)]
        public string Identificatie { get; set; }

        /// <summary>
        /// Het domein waartoe de identificatie behoort.
        /// </summary>
        /// <value>Het domein waartoe de identificatie behoort.</value>
        [DataMember(Name="domein", EmitDefaultValue=false)]
        public string Domein { get; set; }

        /// <summary>
        /// De naam van de woonplaats.
        /// </summary>
        /// <value>De naam van de woonplaats.</value>
        [DataMember(Name="naam", EmitDefaultValue=false)]
        public string Naam { get; set; }

        /// <summary>
        /// Gets or Sets Status
        /// </summary>
        [DataMember(Name="status", EmitDefaultValue=false)]
        public StatusWoonplaatsEnum Status { get; set; }

        /// <summary>
        /// Indicator dat de woonplaats in de registratie is opgenomen door een feitelijke constatering, zonder dat er een brondocument aan ten grondslag ligt. De woonplaats is mogelijk illegaal.
        /// </summary>
        /// <value>Indicator dat de woonplaats in de registratie is opgenomen door een feitelijke constatering, zonder dat er een brondocument aan ten grondslag ligt. De woonplaats is mogelijk illegaal.</value>
        [DataMember(Name="geconstateerd", EmitDefaultValue=false)]
        public bool Geconstateerd { get; set; }

        /// <summary>
        /// De vaststellingsdatum van het brondocument dat de basis is voor opname, wijziging of een verwijdering van een object.
        /// </summary>
        /// <value>De vaststellingsdatum van het brondocument dat de basis is voor opname, wijziging of een verwijdering van een object.</value>
        [DataMember(Name="documentdatum", EmitDefaultValue=false)]
        [JsonConverter(typeof(OpenAPIDateConverter))]
        public DateTime Documentdatum { get; set; }

        /// <summary>
        /// De unieke aanduiding van het brondocument op basis waarvan een opname, mutatie of een verwijdering van gegevens ten aanzien van een woonplaats heeft plaatsgevonden, binnen een gemeente. Alle karakters uit de MES-1 karakterset zijn toegestaan.
        /// </summary>
        /// <value>De unieke aanduiding van het brondocument op basis waarvan een opname, mutatie of een verwijdering van gegevens ten aanzien van een woonplaats heeft plaatsgevonden, binnen een gemeente. Alle karakters uit de MES-1 karakterset zijn toegestaan.</value>
        [DataMember(Name="documentnummer", EmitDefaultValue=false)]
        public string Documentnummer { get; set; }

        /// <summary>
        /// Gets or Sets MogelijkOnjuist
        /// </summary>
        [DataMember(Name="mogelijkOnjuist", EmitDefaultValue=false)]
        public WoonplaatsMogelijkOnjuist MogelijkOnjuist { get; set; }

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.Append("class Woonplaats {\n");
            sb.Append("  Identificatie: ").Append(Identificatie).Append("\n");
            sb.Append("  Domein: ").Append(Domein).Append("\n");
            sb.Append("  Naam: ").Append(Naam).Append("\n");
            sb.Append("  Status: ").Append(Status).Append("\n");
            sb.Append("  Geconstateerd: ").Append(Geconstateerd).Append("\n");
            sb.Append("  Documentdatum: ").Append(Documentdatum).Append("\n");
            sb.Append("  Documentnummer: ").Append(Documentnummer).Append("\n");
            sb.Append("  MogelijkOnjuist: ").Append(MogelijkOnjuist).Append("\n");
            sb.Append("}\n");
            return sb.ToString();
        }

        /// <summary>
        /// Returns the JSON string presentation of the object
        /// </summary>
        /// <returns>JSON string presentation of the object</returns>
        public virtual string ToJson()
        {
            return Newtonsoft.Json.JsonConvert.SerializeObject(this, Newtonsoft.Json.Formatting.Indented);
        }

        /// <summary>
        /// Returns true if objects are equal
        /// </summary>
        /// <param name="input">Object to be compared</param>
        /// <returns>Boolean</returns>
        public override bool Equals(object input)
        {
            return this.Equals(input as Woonplaats);
        }

        /// <summary>
        /// Returns true if Woonplaats instances are equal
        /// </summary>
        /// <param name="input">Instance of Woonplaats to be compared</param>
        /// <returns>Boolean</returns>
        public bool Equals(Woonplaats input)
        {
            if (input == null)
                return false;

            return 
                (
                    this.Identificatie == input.Identificatie ||
                    (this.Identificatie != null &&
                    this.Identificatie.Equals(input.Identificatie))
                ) && 
                (
                    this.Domein == input.Domein ||
                    (this.Domein != null &&
                    this.Domein.Equals(input.Domein))
                ) && 
                (
                    this.Naam == input.Naam ||
                    (this.Naam != null &&
                    this.Naam.Equals(input.Naam))
                ) && 
                (
                    this.Status == input.Status ||
                    (this.Status != null &&
                    this.Status.Equals(input.Status))
                ) && 
                (
                    this.Geconstateerd == input.Geconstateerd ||
                    (this.Geconstateerd != null &&
                    this.Geconstateerd.Equals(input.Geconstateerd))
                ) && 
                (
                    this.Documentdatum == input.Documentdatum ||
                    (this.Documentdatum != null &&
                    this.Documentdatum.Equals(input.Documentdatum))
                ) && 
                (
                    this.Documentnummer == input.Documentnummer ||
                    (this.Documentnummer != null &&
                    this.Documentnummer.Equals(input.Documentnummer))
                ) && 
                (
                    this.MogelijkOnjuist == input.MogelijkOnjuist ||
                    (this.MogelijkOnjuist != null &&
                    this.MogelijkOnjuist.Equals(input.MogelijkOnjuist))
                );
        }

        /// <summary>
        /// Gets the hash code
        /// </summary>
        /// <returns>Hash code</returns>
        public override int GetHashCode()
        {
            unchecked // Overflow is fine, just wrap
            {
                int hashCode = 41;
                if (this.Identificatie != null)
                    hashCode = hashCode * 59 + this.Identificatie.GetHashCode();
                if (this.Domein != null)
                    hashCode = hashCode * 59 + this.Domein.GetHashCode();
                if (this.Naam != null)
                    hashCode = hashCode * 59 + this.Naam.GetHashCode();
                if (this.Status != null)
                    hashCode = hashCode * 59 + this.Status.GetHashCode();
                if (this.Geconstateerd != null)
                    hashCode = hashCode * 59 + this.Geconstateerd.GetHashCode();
                if (this.Documentdatum != null)
                    hashCode = hashCode * 59 + this.Documentdatum.GetHashCode();
                if (this.Documentnummer != null)
                    hashCode = hashCode * 59 + this.Documentnummer.GetHashCode();
                if (this.MogelijkOnjuist != null)
                    hashCode = hashCode * 59 + this.MogelijkOnjuist.GetHashCode();
                return hashCode;
            }
        }

        /// <summary>
        /// To validate all properties of the instance
        /// </summary>
        /// <param name="validationContext">Validation context</param>
        /// <returns>Validation Result</returns>
        IEnumerable<System.ComponentModel.DataAnnotations.ValidationResult> IValidatableObject.Validate(ValidationContext validationContext)
        {
            yield break;
        }
    }

}
