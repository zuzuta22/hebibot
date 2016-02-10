module.exports = (robot) ->
  robot.hear /(.*)\'s weather/i, (msg) ->
   switch msg.match[1]
      when 'today'
        day = 0
      when 'tomorrow'
        day = 1
      else
        day = 2
        break
    request = msg.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=400010')
    .get()
    request (err, res, body) ->
      json = JSON.parse body
      if day == 3 then forecast = 'don\'t know' else forecast = 'Fukuoka\'s weather is ' + json['forecasts'][day]['telop']
      msg.reply forecast
