const { World } = require('./world')
const { Given, When, Then, setWorldConstructor } = require('@cucumber/cucumber');
const should = require('chai').should();
const axios = require('axios');

setWorldConstructor(World);

Given('het pand met identificatie {string} heeft de volgende geometrie polygoon coördinaten', function (string, dataTable) {
});

Given('het adresseerbaar object met identificatie {string} heeft de volgende geometrie punt coördinaten', function (string, dataTable) {
});

When('met {string} {string} wordt gezocht zonder requestheader {string}', async function (verb, path, header) {
    const url = `${this.context.url}${path}`;
    const config = {
        headers: {
            "X-Api-Key": this.context.apiKey
        }
    };

    try {
        this.context.response = await axios.get(url, config);
    }
    catch(e) {
        console.log(e);
    }
});

When('met {string} {string} wordt gezocht met requestheader {string} met waarde {string}', async function (verb, path, headername, headervalue) {  
    const url = `${this.context.url}${path}`;
    let config = {
        headers: {
            "X-Api-Key": this.context.apiKey,
        }
    };
    config.headers[headername] = headervalue;

    try {
        this.context.response = await axios.get(url, config);
    }
    catch(e) {
        console.log(e);
    }
});

When('met {string} {string} wordt gezocht', async function (verb, path) {
    const url = `${this.context.url}${path}`;
    const config = {
        headers: {
            "X-Api-Key": this.context.apiKey
        }
    };

    try {
        this.context.response = await axios.get(url, config);
    }
    catch(e) {
        console.log(e);
    }
});

Then('bevat het resultaat het pand met identificatie {string}', function (pandIdentificatie) {
    // console.log(this.context.response.data);

    const data = this.context.response.data;
    should.exist(data, this.context.response);
    should.exist(data._embedded, data);

    const actual = data._embedded.panden.find(function(pand){
        return pand.identificatie == pandIdentificatie;
    });
    should.exist(actual, `geen pand gevonden met identificatie ${pandIdentificatie}\npanden: ${JSON.stringify(data._embedded.panden, null, "\t")}`);
});

Then('bevat het resultaat GEEN pand met identificatie {string}', function (pandIdentificatie) {
    // console.log(this.context.response.data);

    const data = this.context.response.data;
    should.exist(data, this.context.response);
    should.exist(data._embedded, data);
    if(data._embedded.panden !== undefined) {
        const actual = data._embedded.panden.find(function(pand){
            return pand.identificatie == pandIdentificatie;
        });
        should.not.exist(actual, `pand gevonden met identificatie ${pandIdentificatie}\npanden: ${JSON.stringify(data._embedded.panden, null, "\t")}`);
    }
});

Then('bevat het resultaat niet het pand met identificatie {string}', function (pandIdentificatie) {
    // console.log(this.context.response.data);

    const data = this.context.response.data;
    should.exist(data, this.context.response);
    should.exist(data._embedded, data);
    if(data._embedded.panden !== undefined) {
        const actual = data._embedded.panden.find(function(pand){
            return pand.identificatie == pandIdentificatie;
        });
        should.not.exist(actual, `pand gevonden met identificatie ${pandIdentificatie}\npanden: ${JSON.stringify(data._embedded.panden, null, "\t")}`);
    }
});

Then('bevat het resultaat wel het pand met identificatie {string}', function (pandIdentificatie) {
    // console.log(this.context.response.data);

    const data = this.context.response.data;
    should.exist(data, this.context.response);
    should.exist(data._embedded, data);

    const actual = data._embedded.panden.find(function(pand){
        return pand.identificatie == pandIdentificatie;
    });
    should.exist(actual, `geen pand gevonden met identificatie ${pandIdentificatie}\npanden: ${JSON.stringify(data._embedded.panden, null, "\t")}`);
});

Then('bevat het resultaat het adresseerbaar object met identificatie {string}', function (adresseerbaarObjectIdentificatie) {
    // console.log(this.context.response.data);

    const data = this.context.response.data;
    should.exist(data, this.context.response);
    should.exist(data._embedded, data);

    const actual = data._embedded.adresseerbareObjecten.find(function(adresseerbaarObject){
        return adresseerbaarObject.identificatie == adresseerbaarObjectIdentificatie;
    });
    should.exist(actual, `geen adresseerbaar object gevonden met identificatie ${adresseerbaarObjectIdentificatie}\nadresseerbareObjecten: ${JSON.stringify(data._embedded.adresseerbareObjecten, null, "\t")}`);
});

Then('bevat het resultaat wel het adresseerbaar object met identificatie {string}', function (adresseerbaarObjectIdentificatie) {      
    // console.log(this.context.response.data);

    const data = this.context.response.data;
    should.exist(data, this.context.response);
    should.exist(data._embedded, data);

    const actual = data._embedded.adresseerbareObjecten.find(function(adresseerbaarObject){
        return adresseerbaarObject.identificatie == adresseerbaarObjectIdentificatie;
    });
    should.exist(actual, `geen adresseerbaar object gevonden met identificatie ${adresseerbaarObjectIdentificatie}\nadresseerbareObjecten: ${JSON.stringify(data._embedded.adresseerbareObjecten, null, "\t")}`);
});

Then('bevat het resultaat niet het adresseerbaar object met identificatie {string}', function (adresseerbaarObjectIdentificatie) {     
    // console.log(this.context.response.data);

    const data = this.context.response.data;
    should.exist(data, this.context.response);
    should.exist(data._embedded, data);
    if(data._embedded.adresseerbareObjecten !== undefined) {
        const actual = data._embedded.adresseerbareObjecten.find(function(adresseerbaarObject){
            return adresseerbaarObject.identificatie == adresseerbaarObjectIdentificatie;
        });
        should.not.exist(actual, `adresseerbaar object gevonden met identificatie ${adresseerbaarObjectIdentificatie}\nadresseerbareObjecten: ${JSON.stringify(data._embedded.adresseerbareObjecten, null, "\t")}`);
    }
});
