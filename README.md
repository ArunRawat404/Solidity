# 🧠 Learning Solidity

Code repository of my solidity learning from [Updraft Cyfrin Solidity Course](https://updraft.cyfrin.io/courses/solidity)

---

# 🧠 Solidity Learning Journey

## 📦 Core Concepts Learned

### ✅ Variables & Types
- Basic types: `uint`, `string`, `bool`, `address`
- Complex types: `mapping`, `array` (fixed & dynamic)
- Memory management:
  - `memory`: Temporary, in-function data
  - `storage`: Persistent contract state
  - `calldata`: Read-only external inputs

---

### 🔁 Functions
- **Visibility**: `public`, `private`, `internal`, `external`
- **Modifiers**: `view`, `pure` for read-only and pure computations
- **Constructors**: One-time initialization logic at deployment

---

### 🔐 Access Control
- Using `require()` for validations
- Using **custom errors** like `error NotOwner();` for gas savings
- Ownership checks using `msg.sender`

---

### 💸 Ether & Fallbacks
- `receive()` to accept ETH sent with no data
- `fallback()` to handle ETH sent with data or wrong function calls
- Helps in making contracts robust and payable-friendly

---

## 🧱 Contracts Built

### 1️⃣ SimpleStorage
> A basic contract to store and retrieve variables and all.
- Used `uint256` variable with `set` and `get` functions
- Introduced concepts of `view` and `public` functions

### 2️⃣ `StorageFactory`
> A contract to deploy multiple `SimpleStorage` contracts and interact with them.
- Introduced how to deploy contracts from within another contract
- Used arrays of contract instances
- Interfaced with child contracts programmatically

### 3️⃣ `FundMe`
> A crowdfunding-style contract where users can send ETH and only the owner can withdraw.
- Used `require()` and custom errors for access control
- Worked with `msg.value`, `msg.sender`, and `address(this).balance`
- Implemented `receive()` and `fallback()` for ETH transfers
- Introduced gas optimizations using `immutable` and `constant`

---

💡 **Bonus Concepts**
- Gas Optimization: `immutable`, `constant`, and efficient `revert` patterns
- Handling unmapped keys: Default values in mappings (`0`, `false`, etc.)
---

