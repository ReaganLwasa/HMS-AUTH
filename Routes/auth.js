const express = require('express')
const authController = require('../Controllers/auth')

const router = express.Router()

router.post('/login', authController.login);

module.exports = router;