pragma solidity >=0.4.22 <0.6.0;


contract RecvEther {
    address payable public seller;
    address payable public buyer;
    //uint public recvEther;
    
    modifier onlyBuyer()    { require(msg.sender == buyer); _; }
    modifier onlySeller()   { require(msg.sender == seller); _; }
    
    constructor(address payable _new) public {
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
    
    function buy() public onlyBuyer {
        seller.transfer(getBalance());
    }
    
    function refund() public onlySeller {
        buyer.transfer(getBalance());
    }
}
