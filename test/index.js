const express = require('express');
const app = express();

const PORT = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.send('Cloud Run app is version 10 🚀');
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
