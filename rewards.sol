pragma solidity ^0.8.0;

contract DailyLoginRewards {
    mapping(address => uint256) public lastLogin;
    mapping(address => uint256) public rewards;
    uint256 public rewardAmount = 1 ether;

    function login() public {
        uint256 today = block.timestamp / 1 days;
        require(lastLogin[msg.sender] < today, "Already logged in today");

        lastLogin[msg.sender] = today;
        rewards[msg.sender] += rewardAmount;
    }
    
    function getRewardBalance(address user) public view returns (uint256) {
        return rewards[user];
    }
}
