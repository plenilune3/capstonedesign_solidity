pragma solidity 0.4.8;

contract HelloWorld {
    /* Define variable owner of the type address*/
    string public greeting;

    function HelloWorld(string _greeting){
        greeting = _greeting;
    }

    function setGreering(string _greeting){
        greeting = _greeting;
    }

    function say constant returns(string) {
        return greering;
    }
}