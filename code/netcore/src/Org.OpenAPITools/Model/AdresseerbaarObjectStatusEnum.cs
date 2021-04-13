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
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.IO;
using System.Runtime.Serialization;
using System.Text;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using System.ComponentModel.DataAnnotations;
using OpenAPIDateConverter = Org.OpenAPITools.Client.OpenAPIDateConverter;

namespace Org.OpenAPITools.Model
{
    /// <summary>
    /// Defines AdresseerbaarObjectStatus_enum
    /// </summary>
    
    [JsonConverter(typeof(StringEnumConverter))]
    
    public enum AdresseerbaarObjectStatusEnum
    {
        /// <summary>
        /// Enum PlaatsAangewezen for value: Plaats aangewezen
        /// </summary>
        [EnumMember(Value = "Plaats aangewezen")]
        PlaatsAangewezen = 1,

        /// <summary>
        /// Enum VerblijfsobjectGevormd for value: Verblijfsobject gevormd
        /// </summary>
        [EnumMember(Value = "Verblijfsobject gevormd")]
        VerblijfsobjectGevormd = 2,

        /// <summary>
        /// Enum VerblijfsobjectInGebruiknietIngemeten for value: Verblijfsobject in gebruik (niet ingemeten)
        /// </summary>
        [EnumMember(Value = "Verblijfsobject in gebruik (niet ingemeten)")]
        VerblijfsobjectInGebruiknietIngemeten = 3,

        /// <summary>
        /// Enum VerblijfsobjectInGebruik for value: Verblijfsobject in gebruik
        /// </summary>
        [EnumMember(Value = "Verblijfsobject in gebruik")]
        VerblijfsobjectInGebruik = 4,

        /// <summary>
        /// Enum VerbouwingVerblijfsobject for value: Verbouwing verblijfsobject
        /// </summary>
        [EnumMember(Value = "Verbouwing verblijfsobject")]
        VerbouwingVerblijfsobject = 5,

        /// <summary>
        /// Enum VerblijfsobjectBuitenGebruik for value: Verblijfsobject buiten gebruik
        /// </summary>
        [EnumMember(Value = "Verblijfsobject buiten gebruik")]
        VerblijfsobjectBuitenGebruik = 6

    }

}