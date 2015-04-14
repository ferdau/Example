Db = require 'db'

exports.onInstall = ->
	# set the counter to 0 on plugin installation
	Db.shared.set 'counter', 0

# exported functions prefixed with 'client_' are callable by our client code using `Server.call`
exports.client_incr = ->
	log 'hello world!' # write to the plugin's log
	Db.shared.modify 'counter', (v) -> v+1

exports.client_getTime = (cb) ->
	cb.reply new Date()

exports.onHttp = (request) ->
	# special entrypoint for the Http API: called whenever a request is made to our plugin's inbound URL
	if (data = request.data)?
		Db.shared.set 'http', data
	else
		data = Db.shared.get('http')
	request.respond 200, data || "no data"

exports.client_fetchHn = ->
	Http = require 'http'
	Http.get
		url: 'https://news.ycombinator.com'
		name: 'hnResponse' # corresponds to exports.hnResponse below

exports.hnResponse = (data) !->
	# called when the Http API has the result for the above request
	
	re = /<a href="(http[^"]+)">([^<]+)<\/a>/g
	# regex to find urls/titles in html

	id = 1
	while id < 5 and m = re.exec(data)
		[all, url, title] = m
		log 'hn headline', title, url
		continue if url is 'http://www.ycombinator.com' # header link
		Db.shared.set 'hn', id,
			title: title
			url: url
		id++

exports.onPhoto = (info) !->
	Db.shared.set 'photo', info.key

exports.client_event = !->
	Event = require 'event'
	Event.create
		text: "Test event"
		# sender: Plugin.userId() - use this to prevent event to sender
