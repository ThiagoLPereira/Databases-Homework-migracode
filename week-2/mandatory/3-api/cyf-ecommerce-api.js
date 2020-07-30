const express = require("express");
const app = express();
const { Pool } = require("pg");

const pool = new Pool({
  user: "migracode",
  host: "localhost",
  database: "cyf_ecommerce",
  password: "occlaptop1",
  port: 5432,
});

app.get("/customers", function (req, res) {
  pool
  .query("select name from customers")
  .then((result) => res.json(result.rows))
  .catch((e) => console.error(e));
  // http://localhost:3000/customers //
});

app.get("/suppliers", function (req, res) {
  pool
  .query("select * from suppliers")
  .then((result) => res.json(result.rows))
  .catch((e) => console.error(e));
  // http://localhost:3000/suppliers //
});

app.get("/products", function (req, res) {
  let product = req.params.productID;

  pool
  .query("select  p.product_name, s.supplier_name from products p join suppliers s on p.supplier_id  = s.id")
  .then((result) => res.json(result.rows))
  .catch((e) => console.error(e));
  // http://localhost:3000/products //
});

app.get("/product", function (req, res) {
  let { product } = req.query.name;

  pool
  .query("select * from  products p where product_name =$1", [product])
  .then((result) => res.json(result.rows))
  .catch((e) => console.error(e));
  // http://localhost:3000/product?name=Ball //
});

app.get("/product/:productId", function (req, res) {
  let productID = req.params.productID;
  pool
  .query(`select p.product_name as pname, s.supplier_name as sname from products p join suppliers s on p.supplier_id = s.id where p.id = ${productID}`)
  .then((result) => res.json(result.rows))
  .catch((e) => console.error(e));
  // http://localhost:3000/product/4 //
});


app.listen(3000, function () {
  console.log("Server is listening on port 3000. Ready to accept requests!");
});

//  start server - npm run dev  //