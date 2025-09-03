const express = require("express");
const app = express();
const port = 3000;
const redis = require("redis");
const client = redis.createClient({
  url: `redis://${process.env.REDIS_HOST || "cache"}:${
    process.env.REDIS_PORT || 6379
  }`,
});
client.connect();
app.get("/health", (req, res) => {
  res.send("API is healthy!");
});

app.listen(port, () => {
  console.log(`API running on port ${port}`);
});
