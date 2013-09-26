var express = require('express'),
    app = express(),
    fs = require('fs');

app.set('port', 4000);
app.use(express['static'](__dirname + '/public'));
app.use(function(req, res, next) {
    if (req.xhr) {
        res.status(404).send('404', {url: req.originalUrl});
    } else {
        var index = __dirname + '/public/index.html';
        fs.readFile(index, function (err, main) {
            res.contentType('text/html; charset=UTF-8');
            res.send(main);
        });
    }
});
app.listen(app.get('port'), function () {
    console.log('Listening on: ', app.get('port'));
});
