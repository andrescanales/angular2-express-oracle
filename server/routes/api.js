const express = require('express');
const router = express.Router();
const oracledb = require('oracledb');

// Oracle connection:
var config = {
    "user": "andres",
    "password": "andres",
    "connectString": "127.0.0.1/XE"
}

/* Declare axios for making http requests */
const axios = require('axios');
const API = 'https://jsonplaceholder.typicode.com';

/* GET api listing. */
router.get('/', (req, res) => {
  res.send('api works');
});

router.get('/posts', (req, res)=> {
	// GET posts from the sample API
	axios.get(`${API}/posts`)
	.then(posts => {
		res.status(200).json(posts.data);
	})
	.catch(error => {
		res.status(500).send(error)
	});
});


// Http Method: GET
// URI: /products
// Read all the user profiles
router.get('/products', function (req, res) {
	let conn;
    oracledb.getConnection(config, function(err, conn) {
    	const result =  conn.execute(
	      'SELECT cod_producto, nombre, descripcion, costo_unitario, precio_venta, existencia FROM PRODUCTOS',
	      {},
	      {outFormat: oracledb.OBJECT},
	      function(err, result){
	      	if(err){
	      		res.set('Content-Type', 'application/json');
                res.status(500).send(JSON.stringify({
                    status: 500,
                    message: "Error when getting products",
                    detailed_message: err.message
                }));
	      	}else{
	      		console.log(result.rows);
	    		res.status(200).send(JSON.stringify(result.rows));
	      	}

	    	conn.release(
            	function (err) {
                	if (err) {
                    	console.error(err.message);
                	} else {
                    	console.log("GET /products : Connection released");
               		}
            });
	      }
	    );
    });
});

router.post('/products', function (req, res) {
	let conn;
    oracledb.getConnection(config, function(err, conn) {
    	const result =  conn.execute("UPDATE PRODUCTOS SET nombre = :NOMBRE, costo_unitario: :COSTO_UNITARIO WHERE cod_producto = :COD_PRODUCTO", 
    		[req.body.NOMBRE, req.body.COSTO_UNITARIO, req.body.COD_PRODUCTO], 
    		{
                autoCommit: true,
                outFormat: oracledb.OBJECT // Return the result as Object
            },
	      function(err, result){
	      	if(err){
	      		res.set('Content-Type', 'application/json');
                res.status(500).send(JSON.stringify({
                    status: 500,
                    message: "Error when getting products",
                    detailed_message: err.message
                }));
	      	}else{
	      		console.log(result.rows);
	    		res.status(200).send("Producto editado");
	      	}

	    	conn.release(
            	function (err) {
                	if (err) {
                    	console.error(err.message);
                	} else {
                    	console.log("GET /products : Connection released");
               		}
            });
	      }
	    );
    });
});

module.exports = router;