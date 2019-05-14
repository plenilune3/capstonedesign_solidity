var express = require('express');
var app = express();
var Web3 = require('web3');
var web3 = new Web3(Web3.givenProvider || new Web3.providers.WebsocketProvider('ws://localhost:8545'), null, {});

var _new = '0x5b44b4e4052672b19cadefc892b09488aebbdda6';
var recvetherContract = web3.eth.contract([{"constant":true,"inputs":[],"name":"seller","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getBalance","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"to","type":"address"}],"name":"withdraw","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"buyer","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"_new","type":"address"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"payable":true,"stateMutability":"payable","type":"fallback"}]);
var recvether = recvetherContract.new(
   _new,
   {
     from: web3.eth.accounts[0], 
     data: '0x608060405234801561001057600080fd5b506040516020806103a28339810180604052602081101561003057600080fd5b810190808051906020019092919050505033600160006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff160217905550806000806101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff160217905550506102d0806100d26000396000f3fe60806040526004361061005c576000357c01000000000000000000000000000000000000000000000000000000009004806308551a531461005e57806312065fe0146100b557806351cff8d9146100e05780637150d8ae14610131575b005b34801561006a57600080fd5b50610073610188565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b3480156100c157600080fd5b506100ca6101ad565b6040518082815260200191505060405180910390f35b3480156100ec57600080fd5b5061012f6004803603602081101561010357600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291905050506101d1565b005b34801561013d57600080fd5b5061014661027e565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b6000809054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b6000803090508073ffffffffffffffffffffffffffffffffffffffff163191505090565b600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614151561022d57600080fd5b8073ffffffffffffffffffffffffffffffffffffffff166108fc61024f6101ad565b9081150290604051600060405180830381858888f1935050505015801561027a573d6000803e3d6000fd5b5050565b600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff168156fea165627a7a7230582045637e4ccaf811473d1a75a960c4c1c71e95083e304420faf48eeb74d6c491df0029', 
     gas: '4700000'
   }, function (e, contract){
    console.log(e, contract);
    if (typeof contract.address !== 'undefined') {
         console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash);
    }
 })
 

