'use string';

const script = '/usr/local/rotate-display/scripts/rotate-display.sh';
const { execSync } = require('child_process');

const express = require('express');
const cors = require('cors');
const graphqlHTTP = require('express-graphql');
const { buildSchema } = require('graphql');

const hostname = '0.0.0.0';
const port = 6395;

const schema = buildSchema(`
  type Query {
    rotateDisplay: String
    rebootPi: String
    rotation: String
  }
`);

const root = {
  rotateDisplay: () => {
    console.log('rotating display');
    return execSync(`bash ${script}`).toString().slice(0, -1);
  },
  rebootPi: () => {
    console.log('rebooting computer');
    return execSync('/sbin/shutdown -r now').toString();
  },
  rotation: () => {
    return execSync('tail -1 /boot/config.txt').toString().slice(0, -1);
  }
};

const app = express();

// allow cors
app.use(cors());

app.use('/', graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: true,
}));

app.listen(port, hostname);
console.log(`Running a GraphQL API server at http://${hostname}:${port}`); 
