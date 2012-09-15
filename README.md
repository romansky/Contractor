Contractor
====

Stricter messages in Javascript

## Why?

Sometimes you need a "typed" message bus, where you want to desrib the contract of the API and enforce optional and required parameters.
Contractor will general the wrapper for this contract and make sure you are sending and recieving information as expected


## Installation

		npm install contractor

## Usage

		{Contractor} = require 'contractor'


Create a "contract" with two required parameters

**Create** Contractor.Create(String, <Contractor.Required / Contractor.Optional>..)

		LoginMessageContract = Contractor.Create("LoginMessage", Contractor.Required("user name"), Contractor.Required("password"))

Execute the contract

		console.log LoginMessageContract("knock-knock","itsme!")
		=> ["LoginMessage", "knock-knock","itsme!"]

Bad contract, bad!

		console.log LoginMessageContract("knock-knock")
		=> null

Also, you can always check the name of the contract by calling the toString method

		LoginMessageContract.toString()
		=> "LoginMessage"