const { Given, When, Then, setWorldConstructor } = require('@cucumber/cucumber');
const should = require('chai').should();
const axios = require('axios');

class World {
    constructor({parameters}) {
        this.context = {};
    }
}
setWorldConstructor(World);

When('{string} wordt aangeroepen', async function(path) {
    const url = `https://api.bag.acceptatie.kadaster.nl/esd/huidigebevragingen/v1${path}`;
    const config = {
        headers: {
            "X-Api-Key": "BAG-API-KEY"
        }
    };

    try {
        this.context["response"] = await axios.get(url, config);
    }
    catch(e) {
        this.context["exception"] = e;
    }
});

Then('bevat de response de volgende kenmerken', function (dataTable) {
    let data = this.context["exception"].response.data;

    dataTable.rawTable.forEach(function(value, index) {
        if(index > 0) {
            const actual = '' + data[value[0]];
            const expected = value[1];
            actual.should.equal(expected, JSON.stringify(data, null, "\t"));
        }
    });
});

Then('bevat de response geen invalidParams', function () {
    let invalidParams = this.context["exception"].response.data.invalidParams;

    should.not.exist(invalidParams);
});

Then('bevat de response de volgende invalidParams', function (dataTable) {
    let invalidParams = this.context["exception"].response.data.invalidParams;

    dataTable.rawTable.forEach(function(value, index) {
        if(index > 0) {
            const expected = value;
            let actual = invalidParams.find(function(value) {
                return value["name"] = expected[0];
            });
            actual.should.not.be.null;
            actual.reason.should.equal(expected[1]);
        }
    });
});