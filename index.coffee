useful = require 'useful'
logr = require('node-logr').getLogger("Contractor")

exports.Contractor = class Contractor
	@Required : ()-> useful.makeObject {paramType: "required"}
	@Optional : ()-> useful.makeObject {paramType: "optional"}

	@Create : (name, params...)->
		params = params || []
		envelope = (values...)->
			message = [name]
			for param in params
				value = values.shift()
				switch param.paramType
					when "required"
						if not value
							logr.debug("Bad parameters for param:#{param.toString()} message:#{name} provided:#{params.join(',')}")
							return null
						else message.push(value)
					when "optional" then message.push(value)
			return message

		envelope.toString = ()-> name
		envelope