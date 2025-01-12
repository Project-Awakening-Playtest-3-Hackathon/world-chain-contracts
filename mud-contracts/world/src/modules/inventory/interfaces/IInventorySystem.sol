// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { InventoryItem } from "../types.sol";

/**
 * @title IInventorySystem
 * @dev This interface is to make interacting with the underlying system easier via world.call.
 */
interface IInventorySystem {
  function setInventoryCapacity(uint256 smartObjectId, uint256 storageCapacity) external;

  function depositToInventory(uint256 smartObjectId, InventoryItem[] memory items) external;

  function withdrawFromInventory(uint256 smartObjectId, InventoryItem[] memory items) external;
}
