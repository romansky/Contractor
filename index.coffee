useful = require 'useful'
logr = require('node-logr').getLogger("Contractor")

exports.Contractor = class Contractor
	@Required : (description)-> useful.makeObject {paramType: "required", description: description} 
	@Optional : (description)-> useful.makeObject {paramType: "optional", description: description} 

	@Create : (name, params...)->
		params = params || []
		envelope = (values...)->
			message = [name]
			for param in params
				value = values.shift()
				switch param.paramType
					when "required"
						if not value
							logr.error("Bad arguments for contract \"#{name}\", missing param:\"#{param.paramType}\"-\"#{param.description}\" args:#{JSON.stringify(arguments)}")
							return [name]
						else message.push(value)
					when "optional" then message.push(value)
			return message

		envelope.toString = ()-> name
		envelope



exports.Lawyer = class Lawyer
	@Read : (contract, client)->
		client[contract.shift()].apply(client, contract)