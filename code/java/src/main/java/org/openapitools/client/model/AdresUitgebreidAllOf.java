/*
 * Huidige bevragingen API
 * Deze API levert actuele gegevens over adressen, adresseerbare objecten en panden. Actueel betekent in deze API `zonder eindstatus`. De bron voor deze API is de basisregistratie adressen en gebouwen (BAG).
 *
 * The version of the OpenAPI document: 1.2.0
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
import java.util.ArrayList;
import java.util.List;
import org.openapitools.client.model.AdresMogelijkOnjuist;

/**
 * Het adres is de benaming van een locatie bestaande uit straatnaam, huisnummer, (mogelijk met huisletter, huisnummertoevoeging, postcode) en woonplaatsnaam. Dit is de vereenvoudigde samenstelling van de officiële naamgeving gebaseerd op woonplaats, openbare ruimte en nummeraanduiding.
 */
@ApiModel(description = "Het adres is de benaming van een locatie bestaande uit straatnaam, huisnummer, (mogelijk met huisletter, huisnummertoevoeging, postcode) en woonplaatsnaam. Dit is de vereenvoudigde samenstelling van de officiële naamgeving gebaseerd op woonplaats, openbare ruimte en nummeraanduiding.")
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.JavaClientCodegen", date = "2021-07-13T10:42:05.060374Z[Etc/UTC]")
public class AdresUitgebreidAllOf {
  public static final String SERIALIZED_NAME_ADRESREGEL1 = "adresregel1";
  @SerializedName(SERIALIZED_NAME_ADRESREGEL1)
  private String adresregel1;

  public static final String SERIALIZED_NAME_ADRESREGEL2 = "adresregel2";
  @SerializedName(SERIALIZED_NAME_ADRESREGEL2)
  private String adresregel2;

  public static final String SERIALIZED_NAME_KORTE_NAAM = "korteNaam";
  @SerializedName(SERIALIZED_NAME_KORTE_NAAM)
  private String korteNaam;

  public static final String SERIALIZED_NAME_NUMMERAANDUIDING_IDENTIFICATIE = "nummeraanduidingIdentificatie";
  @SerializedName(SERIALIZED_NAME_NUMMERAANDUIDING_IDENTIFICATIE)
  private String nummeraanduidingIdentificatie;

  public static final String SERIALIZED_NAME_OPENBARE_RUIMTE_IDENTIFICATIE = "openbareRuimteIdentificatie";
  @SerializedName(SERIALIZED_NAME_OPENBARE_RUIMTE_IDENTIFICATIE)
  private String openbareRuimteIdentificatie;

  public static final String SERIALIZED_NAME_WOONPLAATS_IDENTIFICATIE = "woonplaatsIdentificatie";
  @SerializedName(SERIALIZED_NAME_WOONPLAATS_IDENTIFICATIE)
  private String woonplaatsIdentificatie;

  public static final String SERIALIZED_NAME_ADRESSEERBAAR_OBJECT_IDENTIFICATIE = "adresseerbaarObjectIdentificatie";
  @SerializedName(SERIALIZED_NAME_ADRESSEERBAAR_OBJECT_IDENTIFICATIE)
  private String adresseerbaarObjectIdentificatie;

  public static final String SERIALIZED_NAME_PAND_IDENTIFICATIES = "pandIdentificaties";
  @SerializedName(SERIALIZED_NAME_PAND_IDENTIFICATIES)
  private List<String> pandIdentificaties = null;

  public static final String SERIALIZED_NAME_IS_NEVENADRES = "isNevenadres";
  @SerializedName(SERIALIZED_NAME_IS_NEVENADRES)
  private Boolean isNevenadres;

  public static final String SERIALIZED_NAME_GECONSTATEERD = "geconstateerd";
  @SerializedName(SERIALIZED_NAME_GECONSTATEERD)
  private Boolean geconstateerd;

  public static final String SERIALIZED_NAME_MOGELIJK_ONJUIST = "mogelijkOnjuist";
  @SerializedName(SERIALIZED_NAME_MOGELIJK_ONJUIST)
  private AdresMogelijkOnjuist mogelijkOnjuist;


  public AdresUitgebreidAllOf adresregel1(String adresregel1) {
    
    this.adresregel1 = adresregel1;
    return this;
  }

   /**
   * De eerste regel van het adres zoals deze gebruikt kan worden in postadressering.
   * @return adresregel1
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(example = "Ln vd l D-Westervoort 1", value = "De eerste regel van het adres zoals deze gebruikt kan worden in postadressering.")

  public String getAdresregel1() {
    return adresregel1;
  }


  public void setAdresregel1(String adresregel1) {
    this.adresregel1 = adresregel1;
  }


  public AdresUitgebreidAllOf adresregel2(String adresregel2) {
    
    this.adresregel2 = adresregel2;
    return this;
  }

   /**
   * De tweede regel van het adres zoals deze gebruikt kan worden in postadressering.
   * @return adresregel2
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(example = "6922 KZ  DUIVEN", value = "De tweede regel van het adres zoals deze gebruikt kan worden in postadressering.")

  public String getAdresregel2() {
    return adresregel2;
  }


  public void setAdresregel2(String adresregel2) {
    this.adresregel2 = adresregel2;
  }


  public AdresUitgebreidAllOf korteNaam(String korteNaam) {
    
    this.korteNaam = korteNaam;
    return this;
  }

   /**
   * De officiële openbareruimtenaam of een verkorte versie. Beiden hebben maximaal 24 tekens.
   * @return korteNaam
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(example = "Ln vd l D-Westervoort", value = "De officiële openbareruimtenaam of een verkorte versie. Beiden hebben maximaal 24 tekens.")

  public String getKorteNaam() {
    return korteNaam;
  }


  public void setKorteNaam(String korteNaam) {
    this.korteNaam = korteNaam;
  }


  public AdresUitgebreidAllOf nummeraanduidingIdentificatie(String nummeraanduidingIdentificatie) {
    
    this.nummeraanduidingIdentificatie = nummeraanduidingIdentificatie;
    return this;
  }

   /**
   * Fungeert ook als identificatie van het adres.
   * @return nummeraanduidingIdentificatie
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(example = "0226200000038923", value = "Fungeert ook als identificatie van het adres.")

  public String getNummeraanduidingIdentificatie() {
    return nummeraanduidingIdentificatie;
  }


  public void setNummeraanduidingIdentificatie(String nummeraanduidingIdentificatie) {
    this.nummeraanduidingIdentificatie = nummeraanduidingIdentificatie;
  }


  public AdresUitgebreidAllOf openbareRuimteIdentificatie(String openbareRuimteIdentificatie) {
    
    this.openbareRuimteIdentificatie = openbareRuimteIdentificatie;
    return this;
  }

   /**
   * Get openbareRuimteIdentificatie
   * @return openbareRuimteIdentificatie
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(example = "0226300000136166", value = "")

  public String getOpenbareRuimteIdentificatie() {
    return openbareRuimteIdentificatie;
  }


  public void setOpenbareRuimteIdentificatie(String openbareRuimteIdentificatie) {
    this.openbareRuimteIdentificatie = openbareRuimteIdentificatie;
  }


  public AdresUitgebreidAllOf woonplaatsIdentificatie(String woonplaatsIdentificatie) {
    
    this.woonplaatsIdentificatie = woonplaatsIdentificatie;
    return this;
  }

   /**
   * Get woonplaatsIdentificatie
   * @return woonplaatsIdentificatie
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(example = "2096", value = "")

  public String getWoonplaatsIdentificatie() {
    return woonplaatsIdentificatie;
  }


  public void setWoonplaatsIdentificatie(String woonplaatsIdentificatie) {
    this.woonplaatsIdentificatie = woonplaatsIdentificatie;
  }


  public AdresUitgebreidAllOf adresseerbaarObjectIdentificatie(String adresseerbaarObjectIdentificatie) {
    
    this.adresseerbaarObjectIdentificatie = adresseerbaarObjectIdentificatie;
    return this;
  }

   /**
   * Get adresseerbaarObjectIdentificatie
   * @return adresseerbaarObjectIdentificatie
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(example = "0226010000038820", value = "")

  public String getAdresseerbaarObjectIdentificatie() {
    return adresseerbaarObjectIdentificatie;
  }


  public void setAdresseerbaarObjectIdentificatie(String adresseerbaarObjectIdentificatie) {
    this.adresseerbaarObjectIdentificatie = adresseerbaarObjectIdentificatie;
  }


  public AdresUitgebreidAllOf pandIdentificaties(List<String> pandIdentificaties) {
    
    this.pandIdentificaties = pandIdentificaties;
    return this;
  }

  public AdresUitgebreidAllOf addPandIdentificatiesItem(String pandIdentificatiesItem) {
    if (this.pandIdentificaties == null) {
      this.pandIdentificaties = new ArrayList<>();
    }
    this.pandIdentificaties.add(pandIdentificatiesItem);
    return this;
  }

   /**
   * Identificatie(s) van het pand of de panden waar het verblijfsobject deel van is.
   * @return pandIdentificaties
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Identificatie(s) van het pand of de panden waar het verblijfsobject deel van is.")

  public List<String> getPandIdentificaties() {
    return pandIdentificaties;
  }


  public void setPandIdentificaties(List<String> pandIdentificaties) {
    this.pandIdentificaties = pandIdentificaties;
  }


  public AdresUitgebreidAllOf isNevenadres(Boolean isNevenadres) {
    
    this.isNevenadres = isNevenadres;
    return this;
  }

   /**
   * Indicatie dat dit adres een nevenadres is van een adresseerbaar object. Het adres is een hoofdadres als deze indicatie niet wordt meegeleverd.
   * @return isNevenadres
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicatie dat dit adres een nevenadres is van een adresseerbaar object. Het adres is een hoofdadres als deze indicatie niet wordt meegeleverd.")

  public Boolean getIsNevenadres() {
    return isNevenadres;
  }


  public void setIsNevenadres(Boolean isNevenadres) {
    this.isNevenadres = isNevenadres;
  }


  public AdresUitgebreidAllOf geconstateerd(Boolean geconstateerd) {
    
    this.geconstateerd = geconstateerd;
    return this;
  }

   /**
   * Indicatie dat dit adres in de registratie is opgenomen door een feitelijke constatering, zonder dat er sprake was van een brondocument/vergunning. Het adres is mogelijk illegaal.
   * @return geconstateerd
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Indicatie dat dit adres in de registratie is opgenomen door een feitelijke constatering, zonder dat er sprake was van een brondocument/vergunning. Het adres is mogelijk illegaal.")

  public Boolean getGeconstateerd() {
    return geconstateerd;
  }


  public void setGeconstateerd(Boolean geconstateerd) {
    this.geconstateerd = geconstateerd;
  }


  public AdresUitgebreidAllOf mogelijkOnjuist(AdresMogelijkOnjuist mogelijkOnjuist) {
    
    this.mogelijkOnjuist = mogelijkOnjuist;
    return this;
  }

   /**
   * Get mogelijkOnjuist
   * @return mogelijkOnjuist
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public AdresMogelijkOnjuist getMogelijkOnjuist() {
    return mogelijkOnjuist;
  }


  public void setMogelijkOnjuist(AdresMogelijkOnjuist mogelijkOnjuist) {
    this.mogelijkOnjuist = mogelijkOnjuist;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    AdresUitgebreidAllOf adresUitgebreidAllOf = (AdresUitgebreidAllOf) o;
    return Objects.equals(this.adresregel1, adresUitgebreidAllOf.adresregel1) &&
        Objects.equals(this.adresregel2, adresUitgebreidAllOf.adresregel2) &&
        Objects.equals(this.korteNaam, adresUitgebreidAllOf.korteNaam) &&
        Objects.equals(this.nummeraanduidingIdentificatie, adresUitgebreidAllOf.nummeraanduidingIdentificatie) &&
        Objects.equals(this.openbareRuimteIdentificatie, adresUitgebreidAllOf.openbareRuimteIdentificatie) &&
        Objects.equals(this.woonplaatsIdentificatie, adresUitgebreidAllOf.woonplaatsIdentificatie) &&
        Objects.equals(this.adresseerbaarObjectIdentificatie, adresUitgebreidAllOf.adresseerbaarObjectIdentificatie) &&
        Objects.equals(this.pandIdentificaties, adresUitgebreidAllOf.pandIdentificaties) &&
        Objects.equals(this.isNevenadres, adresUitgebreidAllOf.isNevenadres) &&
        Objects.equals(this.geconstateerd, adresUitgebreidAllOf.geconstateerd) &&
        Objects.equals(this.mogelijkOnjuist, adresUitgebreidAllOf.mogelijkOnjuist);
  }

  @Override
  public int hashCode() {
    return Objects.hash(adresregel1, adresregel2, korteNaam, nummeraanduidingIdentificatie, openbareRuimteIdentificatie, woonplaatsIdentificatie, adresseerbaarObjectIdentificatie, pandIdentificaties, isNevenadres, geconstateerd, mogelijkOnjuist);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class AdresUitgebreidAllOf {\n");
    sb.append("    adresregel1: ").append(toIndentedString(adresregel1)).append("\n");
    sb.append("    adresregel2: ").append(toIndentedString(adresregel2)).append("\n");
    sb.append("    korteNaam: ").append(toIndentedString(korteNaam)).append("\n");
    sb.append("    nummeraanduidingIdentificatie: ").append(toIndentedString(nummeraanduidingIdentificatie)).append("\n");
    sb.append("    openbareRuimteIdentificatie: ").append(toIndentedString(openbareRuimteIdentificatie)).append("\n");
    sb.append("    woonplaatsIdentificatie: ").append(toIndentedString(woonplaatsIdentificatie)).append("\n");
    sb.append("    adresseerbaarObjectIdentificatie: ").append(toIndentedString(adresseerbaarObjectIdentificatie)).append("\n");
    sb.append("    pandIdentificaties: ").append(toIndentedString(pandIdentificaties)).append("\n");
    sb.append("    isNevenadres: ").append(toIndentedString(isNevenadres)).append("\n");
    sb.append("    geconstateerd: ").append(toIndentedString(geconstateerd)).append("\n");
    sb.append("    mogelijkOnjuist: ").append(toIndentedString(mogelijkOnjuist)).append("\n");
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

