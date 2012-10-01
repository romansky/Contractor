{Contractor} = require '../'
Lawyer = require('../').Lawyer

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
		expect(res.length).toEqual(1)


	describe "Lawyer",->

		it "can read a contract",->
			contract = Contractor.Create("Simple",Contractor.Required("first param"), Contractor.Required("second param"), Contractor.Optional("third"))
			argsCount = 0
			Lawyer.Read contract("aaa","bbbb","ccc"), {
				Simple: ()-> argsCount += arguments.length
			}
			expect(argsCount).toEqual(3)

			argsCount = 0
			Lawyer.Read contract("aaa"), {
				Simple: ()-> argsCount += arguments.length
			}
			expect(argsCount).toEqual(0)