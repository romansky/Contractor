{Contractor} = require '../'

describe "Contractor", ->

	it "needs to resolve to the name of the message when to string is called", ->
		contract = Contractor.Create("Simple",Contractor.Required("first param"))
		expect(contract.toString()).toEqual("Simple")

	it "needs to create a message with two required parameters and one optional",->
		contract = Contractor.Create("Simple",Contractor.Required("first param"), Contractor.Required("second param"), Contractor.Optional("third param"))
		res = contract("first", "second")
		expect(res).not.toBeNull()

	it "needs to enforce a required parameter and return null when it didnt recieve it",->
		contract = Contractor.Create("Simple",Contractor.Required("first param"), Contractor.Required("second param"), Contractor.Optional("third param"))
		res = contract("first")
		expect(res).toEqual(null)