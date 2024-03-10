const express = require("express");
const os = require("os");
const router = express.Router();

router.get("/", async (req, res) => {
    try {
        const hostname = os.hostname(); // Get the hostname
        res.send({
            ts: new Date(),
            hostname: hostname, // Include the hostname in the response
            msg: 'Everything looks fine here....'
        });
    } catch (error) {
        res.send(error);
    }
});

module.exports = router;
