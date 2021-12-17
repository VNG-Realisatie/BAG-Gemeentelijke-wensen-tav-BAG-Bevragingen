const { World } = require('./world')
const { Given, When, Then, setWorldConstructor } = require('@cucumber/cucumber');
const should = require('chai').should();
const axios = require('axios');

setWorldConstructor(World);

Given('pand met identificatie {string} heeft {int} adresseerbare objecten', function (string, int) {
});

Given('er is een technische fout waardoor er een interne server error optreedt', function () {
});

When('{string} wordt aangeroepen met de volgende queryparameters', async function (path, dataTable) {
    let params = dataTable.hashes().map(function(param) {
        return `${param.naam}=${param.waarde}`;
    }).join("&");
    let url = `${this.context.url}${path}?${params}`;
    // console.log(url);

    const config = {
        headers: {
            "X-Api-Key": this.context.apiKey
        }
    };

    try {
        this.context.response = await axios.get(url, config);
    }
    catch(e) {
        this.context.response = e;
        this.context.hasError = true;
    }
});

When('{string} request wordt gedaan zonder header {string}', async function (path, header) {
    const url = `${this.context.url}${path}`;
    const config = {
        headers: {
            // "X-Api-Key": this.context.apiKey
        }
    };

    try {
        this.context.response = await axios.get(url, config);
    }
    catch(e) {
        this.context.response = e;
        this.context.hasError = true;
    }
});

When('{string} request wordt gedaan met header {string}', async function (path, header) {
    const url = `${this.context.url}${path}`;
    const config = {
        headers: {
            "X-Api-Key": this.context.apiKey
        }
    };
    let hdr = header.split(": ");
    config.headers[hdr[0]] = hdr[1];

    try {
        this.context.response = await axios.get(url, config);
    }
    catch(e) {
        this.context.response = e;
        this.context.hasError = true;
    }
});

When('{string} wordt aangeroepen', async function (path) {
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
        this.context.response = e;
        this.context.hasError = true;
    }
});

Then('bevat de response de volgende invalidParams', function (dataTable) {
    // console.log(this.context.response.response.data);

    const data = this.context.hasError
        ? this.context.response.response.data
        : this.context.response.data;

    dataTable.hashes().forEach(function(expected, index) {
        let actual = data.invalidParams.find(function(invalidParam) {
            return invalidParam.name === expected.name &&
                   invalidParam.code === expected.code &&
                   invalidParam.reason === expected.reason;
        });
        should.exist(actual, `geen invalidParam gevonden met name '${expected.name}', code '${expected.code}', reason '${expected.reason}'\n${JSON.stringify(data.invalidParams , null, "\t")}`);
    });
});

Then('bevat de response ten minste de volgende velden', function (dataTable) {
    // console.log(this.context.response.response);

    const data = this.context.hasError
        ? this.context.response.response.data
        : this.context.response.data;

    dataTable.hashes().forEach(function(value, index) {
        let expected = value.waarde
        let actual = String(data[value.naam]);
        actual.should.equal(expected, JSON.stringify(data, null, "\t"));
    });
});

Then('bevat de response geen veld {string}', function (propertyNaam) {  
    // console.log(this.context.response.response.data);

    const data = this.context.hasError
        ? this.context.response.response.data
        : this.context.response.data;

    should.not.exist(data[propertyNaam], JSON.stringify(data, null, "\t"));
});

Then('is de http status code van het antwoord {int}', function (httpStatusCode) {
    // console.log(this.context.response);

    const response = this.context.hasError
        ? this.context.response.response
        : this.context.response;

    response.status.should.equal(httpStatusCode, JSON.stringify(response.data, null, "\t"));
});

Then('bevat de response de header {string} met waarde {string}', function (headerNaam, headerWaarde) {
    // console.log(this.context.response.response);

    const response = this.context.hasError
        ? this.context.response.response
        : this.context.response;

    response.headers[headerNaam.toLowerCase()].should.equal(headerWaarde, JSON.stringify(response.data, null, "\t"));
});
