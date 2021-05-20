/*
 * Huidige bevragingen API
 * Deze API levert actuele gegevens over adressen, adresseerbare objecten en panden. Actueel betekent in deze API `zonder eindstatus`. De bron voor deze API is de basisregistratie adressen en gebouwen (BAG).
 *
 * The version of the OpenAPI document: 1.1.0
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
import org.openapitools.client.model.HalPaginationLinksAllOfFirst;
import org.openapitools.client.model.HalPaginationLinksAllOfNext;
import org.openapitools.client.model.HalPaginationLinksAllOfPrevious;

/**
 * HalPaginationLinksAllOf
 */
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.JavaClientCodegen", date = "2021-04-16T10:02:13.304775Z[Etc/UTC]")
public class HalPaginationLinksAllOf {
  public static final String SERIALIZED_NAME_FIRST = "first";
  @SerializedName(SERIALIZED_NAME_FIRST)
  private HalPaginationLinksAllOfFirst first;

  public static final String SERIALIZED_NAME_PREVIOUS = "previous";
  @SerializedName(SERIALIZED_NAME_PREVIOUS)
  private HalPaginationLinksAllOfPrevious previous;

  public static final String SERIALIZED_NAME_NEXT = "next";
  @SerializedName(SERIALIZED_NAME_NEXT)
  private HalPaginationLinksAllOfNext next;


  public HalPaginationLinksAllOf first(HalPaginationLinksAllOfFirst first) {
    
    this.first = first;
    return this;
  }

   /**
   * Get first
   * @return first
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public HalPaginationLinksAllOfFirst getFirst() {
    return first;
  }


  public void setFirst(HalPaginationLinksAllOfFirst first) {
    this.first = first;
  }


  public HalPaginationLinksAllOf previous(HalPaginationLinksAllOfPrevious previous) {
    
    this.previous = previous;
    return this;
  }

   /**
   * Get previous
   * @return previous
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public HalPaginationLinksAllOfPrevious getPrevious() {
    return previous;
  }


  public void setPrevious(HalPaginationLinksAllOfPrevious previous) {
    this.previous = previous;
  }


  public HalPaginationLinksAllOf next(HalPaginationLinksAllOfNext next) {
    
    this.next = next;
    return this;
  }

   /**
   * Get next
   * @return next
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public HalPaginationLinksAllOfNext getNext() {
    return next;
  }


  public void setNext(HalPaginationLinksAllOfNext next) {
    this.next = next;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    HalPaginationLinksAllOf halPaginationLinksAllOf = (HalPaginationLinksAllOf) o;
    return Objects.equals(this.first, halPaginationLinksAllOf.first) &&
        Objects.equals(this.previous, halPaginationLinksAllOf.previous) &&
        Objects.equals(this.next, halPaginationLinksAllOf.next);
  }

  @Override
  public int hashCode() {
    return Objects.hash(first, previous, next);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class HalPaginationLinksAllOf {\n");
    sb.append("    first: ").append(toIndentedString(first)).append("\n");
    sb.append("    previous: ").append(toIndentedString(previous)).append("\n");
    sb.append("    next: ").append(toIndentedString(next)).append("\n");
    sb.append("}");
    return sb.toString();
  }

  /**
   * Convert the given object to string with each line indented by 4 spaces
   * (except the first line).
   */
  private String toIndentedString(Object o) {
    if (o == null) {
      return "null";
    }
    return o.toString().replace("\n", "\n    ");
  }

}

