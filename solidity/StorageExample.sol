pragma solidity 0.5.8;

contract SimpleStorage {
    uint public storedData;

    function set(uint x) public {
        storedData = x;
    
    
    }
    function get() public view returns (uint) {
        return storedData;
    }
}
