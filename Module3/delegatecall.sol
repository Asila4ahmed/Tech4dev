pragma solidity ^0.8.0;
contract B{
    uint public num;
    address public sender;
    uint public value;

    function Winner(uint _num) public payable{

        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}
contract A{
    uint public num;
    address public sender;
    uint public value;

    function Uzoh(address _contract, uint _num) public payable{
        (bool success,) = _contract.delegatecall(abi.encodeWithSignature("Winner(uint256)", _num));
    }
}
