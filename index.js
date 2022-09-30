const express = require('express');
const app = express();
const port = 3000;
const bodyParser = require('body-parser');
var path = require('path');

app.use(express.static('public'));
app.set('view engine', 'ejs')

// Optional since express defaults to CWD/views

app.set('views', path.join(__dirname, 'public'));
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

app.post("/fee", function (req, res) {
  const { amount } = req.query;
  const fee = Number(amount) * 0.01;
  const totalAmount = fee + Number(amount);

  res.status(200).json({
    status: {
      code: "000"
    },
    convertedAmount: 500,
    totalAmount,
    fee
  });
})

app.post("/getBinFrom", function (req, res) {
  if (Math.random() < 0.8) {
    res.json({
      "countriesAllowed": true,
      "paymentSystemAllowed": true,
      "fromCardBinResponse": { "countryCode": "UKR", "cardBrand": "VISA" },
      "toCardBinResponse": { "countryCode": "KAZ", "cardBrand": "VISA" },
      "details": null
    });
  } else {
    res.json({
      countriesAllowed: false,
      paymentSystemAllowed: true,
      fromCardBinResponse: { countryCode: "UKR", cardBrand: "MAST" },
      details: "Transfer from {Visa} country to {Uk} country is not allowed",
      toCardBinResponse: { countryCode: "UKR", cardBrand: "MAST" },
    });
  }
});

app.post('/cross-border-info', function (req, res) {
  res.json({
    exchangeRate: 27.101,
    currencyCodeFrom: 978,
    currencyCodeTo: 840,
    currencyFrom: "EUR",
    currencyTo: "USD"
  })
});

app.post("/p2p", function (req, res) {

  const { senderCardNumber, amount, recipientCardNumber } = req.body;
  if (senderCardNumber.replace(/ /g, '') == '4687411079371796') {
    return res.render('success.ejs', { 
      amount: Number(amount).toFixed(2),
      recipientCardNumber: recipientCardNumber.replace(/ /g, '').replace(/\d(?=\d{4})/g, "*")
    })
  }

  return res.render('failure.ejs', { 
    tranCode: 450,
  })

});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);

})