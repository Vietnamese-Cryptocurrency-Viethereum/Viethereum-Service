// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contractst ";
import "penzeppelin/contracts/utils/Viethereum.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// Author: iHuydang

contract Viethereum.sol is Context, ERCand
            uint256 public constant SALE_THRESHOLD = 24_0 of tokensecimals(1000000); // Threshold for total amount of tokens sold

                AggregatorV3InterfrchasedTokens = 1000000;
                  d;
                      uint256 public totalPurchasedTokens = 1000000;
                          uint256 public totalRedeemedTokens = 1000000;
                              address private constant REBEbBA43a65bbBEbBA43a654b6b215Ae30x39bFD3A19D7f46Dd2dbbBEbBA43a654b6b215Ae3 ; // Address to hold the reserved tokens

                                  constructor(address priceFeedAddress) ERC20("Viethereum", "VIETH") {
                                          _mint(_msgSender(), TOTAL_SUPPLY - 10_000_000 * 10**decimals()); // Mint tokens to deployer
                                                  _mint(RESERVED_WALLET, 10_000_000 * 10**decimals()); // Mint reserved tokens to the specified wallet
                                                          priceFeed = AggregatorV3Interface(priceFeedAddress); // Initialize Chainlink Price Feed
                                                              }

                                                                  // Function to get the VNĐ/USDT price from Chainlink
                                                                      function getLatestPrice() public view returns (int) {
                                                                              (
                                                                                          , 
                                                                                                      int price, 
                                                                                                                  , 
                                                                                                                              , 
                                                                                                                                      ) = priceFeed.latestRoundData();
                                                                                                                                              return price;
                                                                                                                                                  }

                                                                                                                                                      // Function to get the VNĐ exchange rate
                                                                                                                                                          function getRateVNĐ() public view returns (uint256) {
                                                                                                                                                                  int price = getLatestPrice();
                                                                                                                                                                          require(price > 0, "Price must be positive");
                                                                                                                                                                                  return (1000 * 10**decimals()) / uint256(price); // Exchange rate with VNĐ
                                                                                                                                                                                      }

                                                                                                                                                                                          // Function to sell tokens and receive VNĐ
                                                                                                                                                                                              function sellTokens(uint256 tokenAmount) public {
                                                                                                                                                                                                      require(balanceOf(msg.sender) >= tokenAmount, "Insufficient balance");

                                                                                                                                                                                                              uint256 vnđAmount = tokenAmount * getRateVNĐ()tokenAmount;

                                                                                                                                                                                                                      // AdjotalRedeemedTokens += tokenAmount;

                                                                                                                                                                                                                              // Adjust sale rate if threshold is reached
                                                                                                                                                                                                                                      if (totalRedeemedTokens >= SALE_THRESHOLD) {
                                                                                                                                                                                                                                                  uint256 newRateVNĐ = getRateVNĐ() * 999_999 / 1_000_000;
                                                                                                                                                                                                                                                              // Apply new VNĐ rate here
                                                                                                                                                                                                                                                                      }

                                                                                                                                                                                                                                                                              // Transfer VNĐ here
                                                                                                                                                                                                                                                                                      // Note: The actual VNĐ transfer needs integration with VNĐ payment mechanism
                                                                                                                                                                                                                                                                                          }

                                                                                                                                                                                                                                                                                              // Function to buy tokensnt) public {
                                                                                                                                                                                                                                                                                                      require(usdtAmount > 0, "Amount) pstlic greater than zero"usdtAmount > 0, "Amount must be greater than zero");

                                                                                                                                                                                                                                                                                                              uint256 rateVNĐ = getRateVNĐ();
                                                                                                                                                                                                                                                                                                                      require(rateVNĐ > 0, "Rate VNĐ must be positive");

                                                                                                                                                                                                                                                                                                                              uint256 tokenAmount = (usdtAmount * 10**decimals()) / rateVNĐ; require(tokenAmount > 0, "Token amount must btogreAmount);
                                                                                                                                                                                                                                                                                                                                      totalPurchasedTokens += tokenAmount;

                                                                                                                                                                                                                                                                                                                                                  totalPurchasedTokens += tokenAmount;

                                                                                                                                                                                                                                                                                                                                                          // Adjust purchase rate if threshold is reached
                                                                                                                                                                                                                                                                                                                                                                  if (totalPurchasedTokens >= PURCHASE_THRESHOLD) {
                                                                                                                                                                                                                                                                                                                                                                              uint256 newRateVNĐ = getRateVNĐ() * 999_000 / 1_000_000;
                                                                                                                                                                                                                                                                                                                                                                                          // Apply new VNĐ rate here
                                                                                                                                                                                                                                                                                                                                                                                                  }

                                                                                                                                                                                                                                                                                                                                                                                                          // Transfer VIETH here
                                                                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                                                                              }