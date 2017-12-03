/* Copyright (c) 2015, 2016, Oracle and/or its affiliates. All rights reserved. */

/******************************************************************************
 *
 * You may not use the identified files except in compliance with the Apache
 * License, Version 2.0 (the "License.")
 *
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * NAME
 *   connect.js
 *
 * DESCRIPTION
 *   Tests a basic connection to the database.
 *   See dbconfig.js for information on connectString formats.
 *
 *****************************************************************************/

var oracledb = require('oracledb');
var dbConfig = require('./dbconfig.js');

/*
oracledb.getConnection(
  {
    user          : dbConfig.user,
    password      : dbConfig.password,
    connectString : dbConfig.connectString
  },
  function(err, connection)
  {
    if (err) {
      console.error(err.message);
      return;
    }
    connection.execute(
      // The statement to execute
      "SELECT nombre, descripcion " +
        "FROM productos " +
        "WHERE cod_producto = :id",

      // The "bind value" 180 for the "bind variable" :id
      [1],
      { maxRows: 10 },
      // Optional execute options argument, such as the query result format
      // or whether to get extra metadata
      // { outFormat: oracledb.OBJECT, extendedMetaData: true },

      // The callback function handles the SQL execution results
      function(err, result)
      {
        if (err) {
          console.error(err.message);
          //doRelease(connection);
          return;
        }
        console.log(result.metaData);
        console.log(result.rows);
        doRelease(connection);
      });

  });

// Note: connections should always be released when not needed
function doRelease(connection)
{
  connection.close(
    function(err) {
      if (err) {
        console.error(err.message);
      }
    });
}

*/
//const oracledb = require('oracledb');
const config = {
  user          : dbConfig.user,
  password      : dbConfig.password,
  connectString : dbConfig.connectString
};

async function getProductos(id) {
  let conn;

  try {
    conn = await oracledb.getConnection(config);

    const result = await conn.execute(
      'select nombre, descripcion from productos',
      {},
      {outFormat: oracledb.OBJECT}
    );

    console.log(result.rows);
  } catch (err) {
    console.log('Ouch!', err);
  } finally {
    if (conn) { // conn assignment worked, need to close
       await conn.close();
    }
  }
}

getProductos(1);



