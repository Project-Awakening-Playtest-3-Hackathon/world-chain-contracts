pragma solidity >=0.8.20;

import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/console.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { ResourceId, WorldResourceIdLib } from "@latticexyz/world/src/WorldResourceId.sol";
import { IBaseWorld } from "@eveworld/world/src/codegen/world/IWorld.sol";
import { SmartObjectData } from "@eveworld/world/src/modules/smart-character/types.sol";
import { EntityRecordData } from "@eveworld/world/src/modules/smart-storage-unit/types.sol";
import { SmartCharacterLib } from "@eveworld/world/src/modules/smart-character/SmartCharacterLib.sol";
import { EntityRecordOffchainTableData } from "@eveworld/world/src/codegen/tables/EntityRecordOffchainTable.sol";
import { FRONTIER_WORLD_DEPLOYMENT_NAMESPACE } from "@eveworld/common-constants/src/constants.sol";

contract CreateSmartCharacter is Script {
  using SmartCharacterLib for SmartCharacterLib.World;

  function run(address worldAddress) public {
    StoreSwitch.setStoreAddress(worldAddress);
    // Load the private key from the `PRIVATE_KEY` environment variable (in .env)
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    // Test values for creating the smart character
    // TODO accept as parameters to the run method for test reproducability
    uint256 characterId = 1253;
    // The address this character will be minted to
    address characterAddress = address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);

    uint256 typeId = 123;
    uint256 itemId = 234;
    uint256 volume = 100;
    string memory cid = "azert";
    string memory characterName = "awesome character";

    // Start broadcasting transactions from the deployer account
    vm.startBroadcast(deployerPrivateKey);
    SmartCharacterLib.World memory smartCharacter = SmartCharacterLib.World({
      iface: IBaseWorld(worldAddress),
      namespace: FRONTIER_WORLD_DEPLOYMENT_NAMESPACE
    });

    smartCharacter.createCharacter(
      characterId,
      characterAddress,
      EntityRecordTableData({ typeId: typeId, itemId: itemId, volume: volume, recordExists: true }),
      EntityRecordOffchainTableData({ name: characterName, dappURL: "noURL", description: "." }),
      cid
    );
    vm.stopBroadcast();
  }
}
