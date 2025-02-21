# Rent_Payment
# Rent Payment Smart Contract

This project is a Solidity-based smart contract that manages rent payments with due dates and penalties. The contract allows a landlord to set a tenant, enforce due dates, accept payments, and charge late fees if rent is paid after the due date.

## Features
- **Landlord and Tenant System**: The landlord assigns a tenant to the contract.
- **Rent Payment**: The tenant can pay rent directly through the smart contract.
- **Late Fee Mechanism**: If the rent is paid after the due date, a late fee is required.
- **Due Date Management**: The landlord can update the due date for a new payment cycle.
- **Event Logging**: Transactions such as rent payments and late fees are recorded via events.

## Deployed Address
The smart contract has been deployed on the **Edu Chain** at the following address:
```
0x2A5D8eC911CD1F5Af7C28E8eFe8e8e8375FDc1f7
```

## Usage
1. **Set Tenant**: The landlord assigns a tenant by calling `setTenant(address _tenant)`.
2. **Pay Rent**: The tenant sends the rent amount via `payRent()`.
3. **Handle Late Fees**: If rent is paid after the due date, an additional late fee must be included.
4. **Reset Due Date**: The landlord updates the rent cycle using `resetDueDate(uint256 _newDueDate)`.

## License
This project is open-source and available under the MIT License.

---

For any questions or contributions, feel free to submit an issue or pull request!

