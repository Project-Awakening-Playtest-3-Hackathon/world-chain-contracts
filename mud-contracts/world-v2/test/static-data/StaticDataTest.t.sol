// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import "forge-std/Test.sol";
import { MudTest } from "@latticexyz/world/test/MudTest.t.sol";
import { IBaseWorld } from "@latticexyz/world/src/codegen/interfaces/IBaseWorld.sol";
import { World } from "@latticexyz/world/src/World.sol";
import { getKeysWithValue } from "@latticexyz/world-modules/src/modules/keyswithvalue/getKeysWithValue.sol";
import { FunctionSelectors } from "@latticexyz/world/src/codegen/tables/FunctionSelectors.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

import { IWorld } from "../../src/codegen/world/IWorld.sol";
import { StaticData } from "../../src/namespaces/evefrontier/codegen/index.sol";
import { StaticDataSystem } from "../../src/namespaces/evefrontier/systems/static-data/StaticDataSystem.sol";
import { StaticData } from "../../src/namespaces/evefrontier/codegen/tables/StaticData.sol";
import { StaticDataMetadata } from "../../src/namespaces/evefrontier/codegen/tables/StaticDataMetadata.sol";

import { StaticDataUtils } from "../../src/namespaces/evefrontier/systems/static-data/StaticDataUtils.sol";

contract StaticDataTest is MudTest {
  IBaseWorld world;
  using StaticDataUtils for bytes14;

  ResourceId systemId = StaticDataUtils.staticDataSystemId();

  function setUp() public virtual override {
    super.setUp();
    world = IBaseWorld(worldAddress);
  }

  function testWorldExists() public {
    uint256 codeSize;
    address addr = worldAddress;
    assembly {
      codeSize := extcodesize(addr)
    }
    assertTrue(codeSize > 0);
  }

  function testSetBaseURI(string memory baseURI) public {
    world.call(systemId, abi.encodeCall(StaticDataSystem.setBaseURI, (baseURI)));

    string memory baseuri = StaticDataMetadata.get();
    assertEq(baseURI, baseuri);
  }

  function testSetCid(uint256 smartObjectId, string memory cid) public {
    vm.assume(smartObjectId != 0);
    world.call(systemId, abi.encodeCall(StaticDataSystem.setCid, (smartObjectId, cid)));

    string memory storedCid = StaticData.get(smartObjectId);

    assertEq(cid, storedCid);
  }
}
