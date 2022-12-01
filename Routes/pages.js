const express = require('express')
const router = express.Router()

router.get('/', (req, res) => {
    res.send('Login');
})
router.get('/TriageNurse', (req, res) => {
    res.send('Triage Nurse Dashboard');
})
router.get('/PharmacyDashboard', (req, res) => {
    res.send('Pharmacy Dashboard');
})
router.get('/DoctorDashboard', (req, res) => {
    res.send('Doctor Dashboard');
})
router.get('/AccountsDashboard', (req, res) => {
    res.send('Accounts Dashboard');
})
router.get('/LabDashboard', (req, res) => {
    res.send('Lab Dashboard');
})
router.get('/DentistDashboard', (req, res) => {
    res.send('Dentist Dashboard');
})

module.exports = router;