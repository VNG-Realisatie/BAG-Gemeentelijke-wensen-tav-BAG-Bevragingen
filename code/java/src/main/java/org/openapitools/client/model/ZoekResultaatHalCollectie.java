/*
 * Huidige bevragingen API
 * Deze API levert actuele gegevens over adressen, adresseerbaar objecten en panden. Actueel betekent in deze API `zonder eindstatus`. De bron voor deze API is de basisregistratie adressen en gebouwen (BAG).
 *
 * The version of the OpenAPI document: 1.0.0
 * Contact: bag@kadaster.nl
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */


package org.openapitools.client.model;

import java.util.Objects;
import java.util.Arrays;
import com.google.gson.TypeAdapter;
import com.google.gson.annotations.JsonAdapter;
import com.google.gson.annotations.SerializedName;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.IOException;
import org.openapitools.client.model.HalPaginationLinksMetLast;
import org.openapitools.client.model.ZoekResultaatHalCollectieEmbedded;

/**
 * Resultaten als lijst
 */
@ApiModel(description = "Resultaten als lijst")
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.JavaClientCodegen", date = "2020-08-11T16:02:19.372+02:00[Europe/Amsterdam]")
public class ZoekResultaatHalCollectie {
  public static final String SERIALIZED_NAME_LINKS = "_links";
  @SerializedName(SERIALIZED_NAME_LINKS)
  private HalPaginationLinksMetLast links = null;

  public static final String SERIALIZED_NAME_EMBEDDED = "_embedded";
  @SerializedName(SERIALIZED_NAME_EMBEDDED)
  private ZoekResultaatHalCollectieEmbedded embedded;


  public ZoekResultaatHalCollectie links(HalPaginationLinksMetLast links) {
    
    this.links = links;
    return this;
  }

   /**
   * Get links
   * @return links
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public HalPaginationLinksMetLast getLinks() {
    return links;
  }


  public void setLinks(HalPaginationLinksMetLast links) {
    this.links = links;
  }


  public ZoekResultaatHalCollectie embedded(ZoekResultaatHalCollectieEmbedded embedded) {
    
    this.embedded = embedded;
    return this;
  }

   /**
   * Get embedded
   * @return embedded
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public ZoekResultaatHalCollectieEmbedded getEmbedded() {
    return embedded;
  }


  public void setEmbedded(ZoekResultaatHalCollectieEmbedded embedded) {
    this.embedded = embedded;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    ZoekResultaatHalCollectie zoekResultaatHalCollectie = (ZoekResultaatHalCollectie) o;
    return Objects.equals(this.links, zoekResultaatHalCollectie.links) &&
        Objects.equals(this.embedded, zoekResultaatHalCollectie.embedded);
  }

  @Override
  public int hashCode() {
    return Objects.hash(links, embedded);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class ZoekResultaatHalCollectie {\n");
    sb.append("    links: ").append(toIndentedString(links)).append("\n");
    sb.append("    embedded: ").append(toIndentedString(embedded)).append("\n");
    sb.append("}");
    return sb.toString();
  }

  /**
   * Convert the given object to string with each line indented by 4 spaces
   * (except the first line).
   */
  private String toIndentedString(java.lang.Object o) {
    if (o == null) {
      return "null";
    }
    return o.toString().replace("\n", "\n    ");
  }

}
