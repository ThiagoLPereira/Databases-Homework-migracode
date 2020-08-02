const express = require('express'),
      app = express(),
      bodyParser = require('body-parser');
const { Pool } = require('pg');
app.use(bodyParser.json());

const pool = new Pool({
    user: "migracode",
    host: "localhost",
    database: "cyf_hotels",
    password: "occlaptop1",
    port: 5432,
});

app.get("/hotels", (req, res) => {
    pool
    .query("SELECT * FROM hotels")
    .then((result)=> res.json(result.rows))
    .catch((e) => console.error(e));
    // http://localhost:3000/hotels //
});

app.get("/customers", (req, res) => {
    pool
    .query("SELECT * FROM customers")
    .then((result)=> res.json(result.rows))
    .catch((e) => console.error(e));
    // http://localhost:3000/customers //
});

app.get("/bookings", (req, res) => {
    pool
    .query("SELECT * FROM bookings")
    .then((result)=> res.json(result.rows))
    .catch((e) => console.error(e));
    // http://localhost:3000/bookings //
});

app.get("/hotels/:hotelId", (req, res) => {
  const { hotelId } = req.params;
  
  pool
     .query("SELECT * FROM hotels WHERE id=$1", [hotelId])
     .then((result) => res.json(result.rows))
     .catch((e) => console.error(e));
    // http://localhost:3000/hotels/4 //
  });

app.get("hotels/:hotelName", (req, res) => {
  const hotelName = req.params.hotelName;
  pool
    .query(`SELECT * FROM hotels WHERE name LIKE '%${hotelName}%' ORDER BY name`)
    .then((result) => res.json(result.rows))
    .catch((e) => console.error(e));
});
  
  app.get("/customers/:customerId", (req, res) => {
    const { customerId } = req.params;
  
    pool
      .query("SELECT * FROM customers WHERE id=$1", [customerId])
      .then((result) => res.json(result.rows))
      .catch((e) => console.error(e));
      // http://localhost:3000/customers/4 //
  });

  app.get("/customers/:customerId/bookings", (req, res) => {
    const { customerId } = req.params;
  
    pool
      .query("SELECT hotels.name, hotels.postcode, nights, checkin_date FROM bookings JOIN hotels ON hotels.id = hotel_id WHERE customer_id=$1", [customerId])
      .then((result) => res.json(result.rows))
      .catch((e) => console.error(e));
      // http://localhost:3000/customers/1/bookings //
  });
  
      app.post("/hotels", function (req, res) {
        const newHotelName = req.body.name;
        const newHotelRooms = req.body.rooms;
        const newHotelPostcode = req.body.postcode;
      
        if (!Number.isInteger(newHotelRooms) || newHotelRooms <= 0) {
          return res
            .status(400)
            .send("The number of rooms should be a positive integer.");
        }
      
        pool
          .query("SELECT * FROM hotels WHERE name=$1", [newHotelName])
          .then((result) => {
            if (result.rows.length > 0) {
              return res
                .status(400)
                .send("An hotel with the same name already exists!");
            } else {
              const query =
                "INSERT INTO hotels (name, rooms, postcode) VALUES ($1, $2, $3)";
              pool
                .query(query, [newHotelName, newHotelRooms, newHotelPostcode])
                .then(() => res.send("Hotel created!"))
                .catch((e) => console.error(e));
            }
          });
      });

      app.post("/customers", function (req, res) {
        const newName = req.body.name;
        const newEmail = req.body.email;
        const newAddress = req.body.rooms;
        const newCity = req.body.city;
        const newPostCode = req.body.postcode;
        const newCountry = req.body.country;
      
        const query = "INSERT INTO customers (name, email, address, city, postcode, country) VALUES ($1, $2, $3, $4, $5, $6)";
      
        pool
          .query(query, [newName, newEmail, newAddress, newCity, newPostCode, newCountry])
          .then(() => res.send("Customer added! =)"))
          .catch((e) => console.error(e));
         // http://localhost:3000/customers //
      });

  app.delete("/customers/:customerId", (req, res) => {
    const customerId = req.params.customerId;
    
    pool
        .query("DELETE FROM bookings WHERE customer_id=$1", [customerId])
        .then (() => {
           pool

               .query("DELETE FROM bookings WHERE id=$1", [customerId])
               .then(() => res.send(`Customer ${customerId} deleted!!!`))
               .catch((e) => console.error(e));
    })
    .catch((e) => console.error(e));
    //DELETED -  http://localhost:3000/customers/1 //
  });

  app.delete("customers/:customerName", (req, res) => {
    const customerName = req.params.customerName;
    pool 
    .query("DELETE FROM booking WHERE name=$1")
    .then(() => {
      pool
          .query("DELETE FROM customers WHERE name=$1", [customerName])
          .then (() => res.send(`Customer with name ${customerName} deleted!`))
          .catch((e) => console.error(e));
    })
    .catch((e) => console.error(e));
  });

  app.put("/customers/:customerId", (req, res) => {
    const customerId = req.params.customerId;
    const { email } = req.body;

    if (!email) {
      return res.status(400).send("email is empty :( !");
    }
    pool
    .query("UPDATE customers SET email=$1 WHERE id=$2", [email, customerId])
    .then(() => res.send(`Customer ${customerId} update!`))
    .catch((e) => console.error(e));  
    //UPDATE http://localhost:3000/customers/10
  });


app.listen(3000, function() {
    console.log("I am working now");
});

//  start server - npm run dev  //