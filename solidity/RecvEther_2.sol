pragma solidity >=0.4.22 <0.6.0;



contract RecvEther {
    address public seller;
    address public buyer;
    //uint public recvEther;
    
    modifier onlyBuyer()    { require(msg.sender == buyer); _; }
    modifier onlySeller()   { require(msg.sender == seller); _; }
    
    constructor(address _new) public {
        buyer = msg.sender;
        seller = _new;
    }
    
    function () external payable {
        //buyer = msg.sender;
        //recvEther += msg.value;
    }
    
    function getBalance() view public returns (uint) {
        address contractAddress = address(this);
        return contractAddress.balance;
    }
    
    // function send(address payable to, uint amount) public onlyBuyer {
    //     to.transfer(amount);
    // }
    
    function wirhdraw(address payable to) public onlyBuyer {
        to.transfer(getBalance());
        //send(to, getBalance());   
    }
}
