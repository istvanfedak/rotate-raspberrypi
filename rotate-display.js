'use string';

const express = require('express');
const graphqlHTTP = require('express-graphql');
const { buildSchema } = require('graphql');

const hostname = '0.0.0.0';
const port = 6395;

const schema = buildSchema(`
  type Query {
    rotateDisplay: String
  }
`);

const root = {
  rotateDisplay: () => {
    return 'It works!';
  }
};

const app = express();

app.use('/', graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: true,
}));

app.listen(port, hostname);
console.log(`Running a GraphQL API server at http://${hostname}:${port}`); 
