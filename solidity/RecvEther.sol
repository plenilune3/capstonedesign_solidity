pragma solidity >=0.4.22 <0.6.0;

contract RecvEther {
   
    address public sender;
    address public owner;
    uint public recvEther;
    
    modifier onlyOwner() { require(msg.sender == owner); _;}
    
    constructor() public {
        owner = msg.sender;
    }
    
    function () external payable {
        sender = msg.sender;
        recvEther += msg.value;
    }
    
    function getBalance() view public returns (uint) {
        address contractAddress = address(this);
        return contractAddress.balance;
    }
    
    function send(address payable to, uint amount) public onlyOwner {
        to.transfer(amount);
    }
    
    function wirhdraw(address payable to) public onlyOwner {
        send(to, getBalance());   
    }
}
