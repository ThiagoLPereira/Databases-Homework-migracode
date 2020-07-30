const express = require('express');
const { Pool } = require('pg');
const app = express();
const bodyParser = require('body')
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

    // Queries //

    app.post("/hotels", function (req, res) {
        const newHotelName = req.body.name;
        const newHotelRooms = req.body.rooms;
        const newHotelPostcode = req.body.postcode;
      
        const query =
          "INSERT INTO hotels (name, rooms, postcode) VALUES ($1, $2, $3)";
      
        pool
          .query(query, [newHotelName, newHotelRooms, newHotelPostcode])
          .then(() => res.send("Hotel created!"))
          .catch((e) => console.error(e));
      });

      // app.post('hotels', (req, res) => {
      //     const newName = req.body.name;
      //     const newRooms = req.body.rooms;
      //     const newPostcode = req.body.postcode;
      //     pool
      //     .query("INSERT INTO hotels (name, rooms, postcode)  VALUES ($1, $2 ,$3)", {
      //         newName,
      //         newRooms,
      //         newPostcode,
      //     })
      //     .then((result)=> res.send("The hotel was created!"))
      //     .catch((e) => console.error(e));
      // });


app.listen(3000, function() {
    console.log("I am working now");
});


//  start server - npm run dev  //