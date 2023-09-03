# MiniYearn Contract

This is a Solidity smart contract named MiniYearn that interacts with AAVE's lending protocol. It allows users to deposit and withdraw ETH, receiving AAVE interest-bearing tokens in return.

## Prerequisites

- Solidity version 0.8.19
- Remix IDE for local testing (import statements are configured for Remix)
- ERC20.sol library (You can find it in the provided GitHub repository)

## Contract Details

- Contract Name: MiniYearn
- Token Name: MiniYearn Token (MYT)
- Token Symbol: MYT
- Decimals: 18

## Functionality

- `deposit()`: Allows users to deposit ETH into the contract and receive MYT tokens.
- `withdraw(uint256 amount)`: Allows users to withdraw a specified amount of their deposited ETH along with the corresponding MYT tokens.
- `getPrice()`: Returns the price of MYT tokens in relation to the deposited liquidity.
- `getUnderlying()`: Returns the amount of ETH deposited in the AAVE lending protocol.

## Deployment

1. Deploy the contract on a supported Ethereum development environment (e.g., Remix IDE).
   You will need the address of the WETH Gateway, the pool and the aEth Token.
2. Provide the contract's address to users who want to interact with it.

## Usage

1. Users can deposit ETH by calling the `deposit()` function.
2. Users can withdraw their deposited ETH along with the corresponding MYT tokens by calling the `withdraw(uint256 amount)` function.

## Disclaimer

This contract is for educational purposes and experimentation with AAVE's lending protocol. Use it at your own risk.

## License

This contract is open-source and released under the GNU General Public License version 3.0. Refer to the SPDX-License-Identifier for more details.
