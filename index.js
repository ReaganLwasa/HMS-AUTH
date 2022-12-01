const express = require("express");
const path = require("path");
const cors = require("cors")
const app = express();

const port = 3001

app.use(express.urlencoded({ extended: false }))
app.use(express.json())
app.use('/', require('./Routes/pages'));
app.use('/auth', require('./Routes/auth'))

app.listen(port, () => {
    console.log(`Server is listenng on port ${port}`);
})


