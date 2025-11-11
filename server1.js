import express from "express";

const app = express()
const PORT = 4000
let reqCount = 0;

app.use((req, res, next) => {
    reqCount++
    console.log(`Total requests so far: ${reqCount}`)
    next()
})

app.get('/', (req, res) => {
    res.send(`Hello! This server(1) has handled ${reqCount} requests so far.`);
})

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`))