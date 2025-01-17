const app = require('./app');
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => console.log(`service1 running on port 3001`));
