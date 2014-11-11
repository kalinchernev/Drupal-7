// BASE SETUP
// =============================================================================

// call the packages we need
var express = require('express');
var bodyParser = require('body-parser');
var app = express();

// configure app
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

var port = process.env.PORT || 8080; // set our port

var mongoose = require('mongoose');
mongoose.connect('mongodb://rest-lecture'); // connect to database
var Drop = require('./app/models/drop');

// ROUTES FOR OUR API
// =============================================================================

// create our router
var router = express.Router();

// middleware to use for all requests
router.use(function (req, res, next) {
    // do logging
    console.log("request coming in");
//	console.log(req);
//	console.log(res);
    next();
});

// test route to make sure everything is working (accessed at GET http://localhost:8080/api)
router.get('/', function (req, res) {
    res.json({message: 'hooray! welcome to our api!'});
});

// on routes that end in /drops
// ----------------------------------------------------
router.route('/drops')

        // create a drop (accessed at POST http://localhost:8080/drops)
        .post(function (req, res) {

            var drop = new Drop();		// create a new instance of the Drop model
            drop.name = req.body.name;  // set the drops name (comes from the request)
//		console.log(req.body);

            drop.save(function (err) {
                if (err)
                    res.send(err);

                res.json({message: 'Drop created!'});
            });


        })

        // get all the drops (accessed at GET http://localhost:8080/api/drops)
        .get(function (req, res) {
            Drop.find(function (err, drops) {
                if (err)
                    res.send(err);

                res.json(drops);
            });
        });

// on routes that end in /drops/:drop_id
// ----------------------------------------------------
router.route('/drops/:drop_id')

        // get the drop with that id
        .get(function (req, res) {
            Drop.findById(req.params.drop_id, function (err, drop) {
                if (err)
                    res.send(err);
                res.json(drop);
            });
        })

        // update the drop with this id
        .put(function (req, res) {
            Drop.findById(req.params.drop_id, function (err, drop) {

                if (err)
                    res.send(err);

                drop.name = req.body.name;
                drop.save(function (err) {
                    if (err)
                        res.send(err);

                    res.json({message: 'Drop updated!'});
                });

            });
        })

        // delete the drop with this id
        .delete(function (req, res) {
            Drop.remove({
                _id: req.params.drop_id
            }, function (err, drop) {
                if (err)
                    res.send(err);

                res.json({message: 'Drop successfully deleted'});
            });
        });


// REGISTER OUR ROUTES -------------------------------
app.use('/api', router);

// START THE SERVER
// =============================================================================
app.listen(port);
console.log('Magic happens on port ' + port);
