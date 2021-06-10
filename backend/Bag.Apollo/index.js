const { ApolloServer } = require('apollo-server');
const { loadSchemaSync } = require('@graphql-tools/load') ;
const { GraphQLFileLoader } = require('@graphql-tools/graphql-file-loader');

const schema = loadSchemaSync('../../specificatie-graphql/schema.graphql', {
  loaders: [
    new GraphQLFileLoader(),
  ]
});


const server = new ApolloServer({ schema: schema });

server.listen({ port: 4000 }).then(({ url }) => {
  console.log(`graphql running at ${url}`);
});
