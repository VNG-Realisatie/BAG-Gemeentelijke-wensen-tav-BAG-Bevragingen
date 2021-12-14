class World {
    constructor({parameters}) {
        this.context = {
            url: 'https://api.bag.acceptatie.kadaster.nl/esd/huidigebevragingen/v1',
            apiKey: '<bag-api-key>'
        };
    }
}

module.exports = {World}
