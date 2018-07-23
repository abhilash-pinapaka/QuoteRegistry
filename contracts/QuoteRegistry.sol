pragma solidity ^0.4.23;

contract QuoteRegistry {
    address ContractOwner;
    mapping (string => address) QuoteRegister;

    constructor () public {
        ContractOwner = msg.sender;
    }
    
    modifier isOwner {
        require(msg.sender == ContractOwner);
        _;
    }
    
    function register(string _quote) public {
        QuoteRegister[_quote] = msg.sender;
    }
    
    function ownership(string _quote) public view returns (address) {
        return QuoteRegister[_quote];
    }
    
    function transfer(string _quote, address _newOwner) public payable{
        
        require(msg.value >= 0.5 ether);
        address quoteOwnerAddr = QuoteRegister[_quote];
        quoteOwnerAddr.transfer(msg.value);
        QuoteRegister[_quote] = _newOwner;


    }
    
    function owner() public view returns (address) {
        return ContractOwner;
    }

    /*function getBalance(address _addr) internal view returns (uint256) {
        return _addr.balance;
    }*/
}