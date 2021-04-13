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
    /// Een aanduiding van alle waarden die de status van een woonplaats kan aannemen.
    /// </summary>
    /// <value>Een aanduiding van alle waarden die de status van een woonplaats kan aannemen.</value>
    
    [JsonConverter(typeof(StringEnumConverter))]
    
    public enum StatusWoonplaatsEnum
    {
        /// <summary>
        /// Enum Woonplaatsaangewezen for value: Woonplaats aangewezen
        /// </summary>
        [EnumMember(Value = "Woonplaats aangewezen")]
        Woonplaatsaangewezen = 1

    }

}