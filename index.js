const express = require("express");
const multer = require("multer");
const { exec } = require("child_process");

const app = express();
const port = 3000;

const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

app.post("/upload", upload.single("image"), (req, res) => {
  exec("python remove_background.py", (error, stdout, stderr) => {
    if (error) {
      console.error(`Error: ${error}`);
      res.status(500).json({ error: "Image processing failed" });
    } else {
      res.set("Content-Type", "image/png");
      res.send(stdout);
    }
  }).stdin.write(req.file.buffer);
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
