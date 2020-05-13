'use string';

const script = '/usr/local/rotate-display/scripts/rotate-display.sh';
const { execSync } = require('child_process');

const express = require('express');
const graphqlHTTP = require('express-graphql');
const { buildSchema } = require('graphql');

const hostname = '0.0.0.0';
const port = 6395;

const schema = buildSchema(`
  type Query {
    rotateDisplay: String
    rebootPi: String
  }
`);

const root = {
  rotateDisplay: () => {
    return execSync(`bash ${script}`).toString().slice(0, -1);
  },
  rebootPi: () => {
    return execSync('/sbin/shutdown -r now');
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
