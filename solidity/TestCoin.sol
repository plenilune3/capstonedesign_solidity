pragma solidity >=0.5.0 < 0.6.0;

contract Owned {
    
    address payable public owner;
    
    event TrasferOwnership(address oldaddr, address newaddr);
    
    constructor() public { owner = msg.sender; }
    
    modifier onlyOwner() { require(msg.sender == owner); _;}
    
    function trasferOwnership(address payable _new) public onlyOwner {
        address oldaddr = owner;
        owner = _new;
        emit TrasferOwnership(oldaddr, owner);
    }
    
    function kill() public {
        require(owner == msg.sender);
        selfdestruct(owner);
    }
    
}

contract TestCoin is Owned {
     
    address public minter;
    mapping (address => uint) public balances;
    
    event Sent(address from, address to, uint amount);
     
    constructor() public {
        minter = owner;
    }
    
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }
    
    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
