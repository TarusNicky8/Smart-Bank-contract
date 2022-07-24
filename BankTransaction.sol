//SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract BankTransaction{
    address public owner;
    mapping (address => uint) private balances;

    constructor () {
        owner = msg.sender;
    }

    function isOwner () public view returns(bool){
        return msg.sender == owner;
    }

    modifier onlyOwner(){
        require(isOwner());
        _;
    }

    function deposit () public payable{
        require ((balances[msg.sender] + msg.value) >= balances[msg.sender]);
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint withdrawAmount) public{
        require(withdrawAmount <= balances[msg.sender]);

        balances[msg.sender] -= withdrawAmount;
        payable(msg.sender).transfer(withdrawAmount);
    }

    function withdrawAll() public onlyOwner{
        payable(msg.sender).transfer(address(this).balance);
    }
}
