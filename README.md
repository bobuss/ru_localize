ru_localize
===========

Ultra simple and useless geoip service... this time in ruby


Requirements
------------

- Install [the sinatra microframework](http://www.sinatrarb.com/)

        $ sudo gem install sinatra

- Then some extra libs

        $ sudo gem install geoip
        $ sudo gem install json

- Install the MaxMind-s GeoIP database

        $ cd data && wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
        $ gunzip GeoLiteCity.dat.gz && cd ..

- Start the server: `ruby localize.rb`


Try it
------

You can test it with a browser or with curl

    $ curl -i http://localhost:4567/74.125.230.223

The server will response a 200 with a json

    HTTP/1.1 200 OK
    Connection: Keep-Alive
    Date: Tue, 11 Sep 2012 10:05:51 GMT
    X-Xss-Protection: 1; mode=block
    Content-Length: 320
    X-Frame-Options: sameorigin
    Content-Type: text/html;charset=utf-8
    Server: WEBrick/1.3.1 (Ruby/1.8.7/2011-12-28)

    {"country_name":"United States","latitude":37.4192,"request":"74.125.230.223","continent_code":"NA","longitude":-122.0574,"dma_code":807,"region_name":"CA","area_code":650,"country_code2":"US","city_name":"Mountain View","ip":"74.125.230.223","timezone":"America/Los_Angeles","country_code3":"USA","postal_code":"94043"}

In case the given IP does not find a localization, the server will response a 404

    $ curl -i http://localhost:4567/127.0.0.1

    HTTP/1.1 404 Not Found
    Content-Type: application/json; charset=utf8
    Server: WEBrick/1.3.1 (Ruby/1.8.7/2011-12-28)
    X-Xss-Protection: 1; mode=block
    X-Frame-Options: sameorigin
    Content-Length: 36
    Connection: Keep-Alive
    Date: Tue, 11 Sep 2012 11:38:10 GMT

    {"message":"No localization found."}

Finaly, a last case is provided if you mispealed the IP in the URI, by send us a 400

    $ curl -i  http://localhost:4567/127.0.0

    HTTP/1.1 400 Bad Request
    Content-Type: application/json; charset=utf8
    Server: WEBrick/1.3.1 (Ruby/1.8.7/2011-12-28)
    X-Xss-Protection: 1; mode=block
    X-Frame-Options: sameorigin
    Content-Length: 51
    Connection: Keep-Alive
    Date: Tue, 11 Sep 2012 11:38:45 GMT

    {"message":"Bad request: must be a /x.y.z.t form."}

License
-------

(The MIT License)

Copyright (c) 2012 Bertrand Tornil <bertrand.tornil@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

This product includes GeoLite data created by MaxMind, available from http://maxmind.com/