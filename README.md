Contractor
====

Stricter messages in Javascript

## Why?

Sometimes you need to communicate an API for, where you want to desribe the contract of the API and enforce optional and required parameters.
Contractor will generate a wrapper function for this contract and make sure the api is used as designed


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