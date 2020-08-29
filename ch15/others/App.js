var Web3 = require('web3');
if (typeof web3 !== 'undefined') {
web3 = new Web3(web3.currentProvider);
} else {
// set the provider you want from Web3.providers
web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
}
web3.eth.defaultAccount = web3.eth.accounts[0];
var SimpleContract = web3.eth.contract([
{
"constant": false,
"inputs": [
{
"name": "x",
"type": "uint8"
}
],
"name": "Matcher",
"outputs": [
{
"name": "",
"type": "bool"
}
],
"payable": false,
"stateMutability": "nonpayable",

"type": "function"
},
{
"anonymous": false,
"inputs": [
{
"indexed": false,
"name": "returnValue",
"type": "bool"
}
],
"name": "valueEvent",
"type": "event"
}
]);
var simplecontract = SimpleContract.at("0x82012b7601fd23669b50bb7dd79460970ce386e3");
console.log(simplecontract);
function callMatchertrue()
{
var txn = simplecontract.Matcher.call(12);
{
};
console.log("return value: " + txn);
}
function callMatcherfalse()
{
var txn = simplecontract.Matcher.call(1);{
};
console.log("return value: " + txn);
}
function myFunction()
{
var x = document.getElementById("txtValue").value;
var txn = simplecontract.Matcher.call(x);{
};
console.log("return value: " + txn);

document.getElementById("decision").innerHTML = txn;
}