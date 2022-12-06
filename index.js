const express = require("express");
const app = express();
const path = require("path");
const cors = require("cors")
const mysql = require('mysql')

const dotenv = require('dotenv');
const { response } = require("express");
const corsOptions = {
    origin:'http://localhost:3000'
}
dotenv.config({path: './.env'});
app.use(cors(corsOptions))
const port = process.env.SERVER_PORT;

const db = mysql.createConnection({
    host:process.env.DATABASE_HOST,
    user:process.env.DATABASE_USER,
    password:process.env.DATABASE_PASSWORD,
    database:process.env.DATABASE
})


try {
    db.connect(); 
    console.log('database connection is successful')
} catch (error) {
    console.log(error)
}


app.use(express.urlencoded({ extended: true }))
app.use(express.json())
// app.use('/', require('./Routes/pages'));
// app.use('/auth', require('./Routes/auth'))

app.post('/login',(req,res)=>{
    const department = req.body.department
    const username = req.body.username
    const password  = req.body.password
    // console.log(`parameters passed are ${department} and ${username} and ${password}`)

    //check if the parameters are not empty
    if(department != '' && username !='' && password !=''){
        //query that will seek out the details if they exist in that particular department
        db.query('SELECT * FROM users WHERE department=? AND username=?;',department,username, (error, results)=>{
            //if the query is faulty , throw the error
            if(error) throw error;
            //if account exists
            if(results.length>0){
                bcrypt.compare(password,results[0].password,(error, response)=>{
                    if(error) throw error;
                    if(response){
                        const token = jwt.sign({
                            username: results[0].username,
                            userId:results[0].Id,
                        },'SECRETKEY',{
                            expiresIn:'1d'
                        }
                        );
                        db.query(
                            `UPDATE users SET_login = now() WHERE Id = ${results[0].Id}`
                        );
                        res.send({
                            token,
                            user:results[0].username
                        })
                        res.redirect(301,`/${department}Dashboard`)
                    }else{
                        res.send('Incorrect login details.Please cross check and try again');
                    }
                })
            }else{
                res.send('User does not exist.Please contact the system administrator.')
            }
        })
    }
})

app.listen(port, () => {
    console.log(`Server is listening on port ${port}`);
})


