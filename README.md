Contractor
====

Stricter messages in Javascript

## Why?

In a dynamic language world, you might need to declare a contract for communicating with your APIs, create contracts with Contractor and use them, with:

 * server + client side
 * pub / sub implementation
 * external API's
 * Socket.IO communication

Contractor will generate a wrapper function for this "contract" and make sure the api is used as designed, no more, no less.

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


## Layer

One option to use Contracts is a Laweyer

	Lawyer = require('contractor').Lawyer

Create an object that will handle the different events

	client = {
		LoginMessage : (userName, password)-> # do something here...
	}

Use the lawyer on the contract and client

	Layer.Read LoginMessageContract("its me!","white rabbit"), client