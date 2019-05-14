pragma solidity ^0.4.25;

contract HelloWorld {
    string private greeting;
    constructor() public{
        greeting = "Hi! JeongJoo!";
    }
    function setGreeting(string _greeting) public {
        greeting = _greeting;
    }
    function getGreeting() public view returns (string) {
        return greeting;
    }
}
