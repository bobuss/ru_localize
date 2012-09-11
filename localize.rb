require 'rubygems'
require 'sinatra'
require 'geoip'
require 'json'


gi = GeoIP.new('./data/GeoLiteCity.dat')

$error_statuses = {
    400 => 'Bad request: must be a /x.y.z.t form.',
    404 => 'No localization found.'
}

def get_message(status)
    return {'message' => $error_statuses[status]}.to_json
end

get '/:uri' do |uri|
    logger.info uri
    if (uri =~ /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/)
        logger.info 'ip found'
        result = gi.city(params[:uri])
        if result == nil then
            status 404
            content_type 'application/json; charset=utf8'
            get_message(404)
        else
            result.to_hash.to_json
        end
    else
        logger.info 'ip not found'
        status 400
        content_type 'application/json; charset=utf8'
        get_message(400)
    end
end


