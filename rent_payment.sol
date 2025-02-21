pragma solidity ^0.8.0;

contract RentPayment {
    address public landlord;
    address public tenant;
    uint256 public rentAmount = 1 ether; // Rent amount in Wei
    uint256 public dueDate = block.timestamp + 30 days; // Due date for rent payment
    uint256 public lateFee = 0.1 ether; // Fixed late fee
    bool public rentPaid;
    
    event RentPaid(address indexed tenant, uint256 amount, uint256 timestamp);
    event LateFeePaid(address indexed tenant, uint256 amount, uint256 timestamp);

    modifier onlyTenant() {
        require(msg.sender == tenant, "Only tenant can perform this action");
        _;
    }
    
    modifier onlyLandlord() {
        require(msg.sender == landlord, "Only landlord can perform this action");
        _;
    }

    constructor() {
        landlord = msg.sender; // The contract deployer is the landlord
    }

    function setTenant(address _tenant) external onlyLandlord {
        tenant = _tenant;
    }

    function payRent() external payable onlyTenant {
        require(!rentPaid, "Rent already paid");
        require(msg.value >= rentAmount, "Insufficient rent payment");
        
        if (block.timestamp > dueDate) {
            require(msg.value >= rentAmount + lateFee, "Late fee required");
            emit LateFeePaid(msg.sender, lateFee, block.timestamp);
        }
        
        rentPaid = true;
        payable(landlord).transfer(msg.value);
        emit RentPaid(msg.sender, msg.value, block.timestamp);
    }
    
    function resetDueDate(uint256 _newDueDate) external onlyLandlord {
        require(_newDueDate > block.timestamp, "Due date must be in the future");
        dueDate = _newDueDate;
        rentPaid = false; // Reset rent payment status for the new period
    }
}
