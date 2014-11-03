var mongoose     = require('mongoose');
var Schema       = mongoose.Schema;

var DropSchema   = new Schema({
	name: String
});

module.exports = mongoose.model('Drop', DropSchema);