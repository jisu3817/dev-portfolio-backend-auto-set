import express from 'express';
import swaggerUi from 'swagger-ui-express';
import YAML from 'yamljs';
import path from 'path';
import 'dotenv/config';

const swaggerSpec = YAML.load(path.join(__dirname, './swagger.yaml'));

const app = express();
const PORT = process.env.PORT || 3000;

import header from './src/apis/header';
import visitor from './src/apis/visitor';

app.listen(PORT, () => {
  console.log(`server start at ${PORT}`);
});

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/swagger', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

app.use('/api/header', header);
app.use('/api/visitor', visitor);

export = app;
