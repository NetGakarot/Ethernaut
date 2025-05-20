# Ethernaut Level 1: Fallback

## 🔧 Challenge Summary:
The contract has a fallback function that can transfer ownership if certain conditions are met.

## 🎯 Objective:
Become the owner of the contract and withdraw the balance.

---

## ✅ Solution Strategy:

1. Call `contribute()` with a small amount of ETH.  
   → This adds your address to the `balances` mapping.

2. Send ETH directly to the contract (not via any function).  
   → This triggers the `receive()` function (fallback), which checks if `msg.value > 0` and you’re in `balances`.

3. If both conditions are true, the fallback sets you as the **owner**.

4. Now call `withdraw()` to drain the contract balance.

---

## 🧪 Testing:
All steps have been automated using a Foundry test script inside `foundryTest/Fallback.t.sol`.

Run the tests:

```bash
forge test
