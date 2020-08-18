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
import com.google.gson.annotations.SerializedName;

import java.io.IOException;
import com.google.gson.TypeAdapter;
import com.google.gson.annotations.JsonAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;

/**
 * Gets or Sets AdresseerbaarObjectStatus_enum
 */
@JsonAdapter(AdresseerbaarObjectStatusEnum.Adapter.class)
public enum AdresseerbaarObjectStatusEnum {
  
  PLAATS_AANGEWEZEN("Plaats aangewezen"),
  
  VERBLIJFSOBJECT_GEVORMD("Verblijfsobject gevormd"),
  
  VERBLIJFSOBJECT_IN_GEBRUIK_NIET_INGEMETEN_("Verblijfsobject in gebruik (niet ingemeten)"),
  
  VERBLIJFSOBJECT_IN_GEBRUIK("Verblijfsobject in gebruik"),
  
  VERBOUWING_VERBLIJFSOBJECT("Verbouwing verblijfsobject"),
  
  VERBLIJFSOBJECT_BUITEN_GEBRUIK("Verblijfsobject buiten gebruik");

  private String value;

  AdresseerbaarObjectStatusEnum(String value) {
    this.value = value;
  }

  public String getValue() {
    return value;
  }

  @Override
  public String toString() {
    return String.valueOf(value);
  }

  public static AdresseerbaarObjectStatusEnum fromValue(String value) {
    for (AdresseerbaarObjectStatusEnum b : AdresseerbaarObjectStatusEnum.values()) {
      if (b.value.equals(value)) {
        return b;
      }
    }
    throw new IllegalArgumentException("Unexpected value '" + value + "'");
  }

  public static class Adapter extends TypeAdapter<AdresseerbaarObjectStatusEnum> {
    @Override
    public void write(final JsonWriter jsonWriter, final AdresseerbaarObjectStatusEnum enumeration) throws IOException {
      jsonWriter.value(enumeration.getValue());
    }

    @Override
    public AdresseerbaarObjectStatusEnum read(final JsonReader jsonReader) throws IOException {
      String value = jsonReader.nextString();
      return AdresseerbaarObjectStatusEnum.fromValue(value);
    }
  }
}
