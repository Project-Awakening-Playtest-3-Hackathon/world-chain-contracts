// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema } from "@latticexyz/store/src/Schema.sol";
import { EncodedLengths, EncodedLengthsLib } from "@latticexyz/store/src/EncodedLengths.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

// Import user types
import { Id } from "../../../../libs/Id.sol";

struct SystemTagsData {
  bool exists;
  bytes32[] classes;
  bytes32[] objects;
}

library SystemTags {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "evefrontier", name: "SystemTags", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x746265766566726f6e7469657200000053797374656d54616773000000000000);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x0001010201000000000000000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (bytes32)
  Schema constant _keySchema = Schema.wrap(0x002001005f000000000000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (bool, bytes32[], bytes32[])
  Schema constant _valueSchema = Schema.wrap(0x0001010260c1c100000000000000000000000000000000000000000000000000);

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "tagId";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](3);
    fieldNames[0] = "exists";
    fieldNames[1] = "classes";
    fieldNames[2] = "objects";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get exists.
   */
  function getExists(Id tagId) internal view returns (bool exists) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Get exists.
   */
  function _getExists(Id tagId) internal view returns (bool exists) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Set exists.
   */
  function setExists(Id tagId, bool exists) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((exists)), _fieldLayout);
  }

  /**
   * @notice Set exists.
   */
  function _setExists(Id tagId, bool exists) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((exists)), _fieldLayout);
  }

  /**
   * @notice Get classes.
   */
  function getClasses(Id tagId) internal view returns (bytes32[] memory classes) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Get classes.
   */
  function _getClasses(Id tagId) internal view returns (bytes32[] memory classes) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Set classes.
   */
  function setClasses(Id tagId, bytes32[] memory classes) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((classes)));
  }

  /**
   * @notice Set classes.
   */
  function _setClasses(Id tagId, bytes32[] memory classes) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((classes)));
  }

  /**
   * @notice Get the length of classes.
   */
  function lengthClasses(Id tagId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get the length of classes.
   */
  function _lengthClasses(Id tagId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get an item of classes.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemClasses(Id tagId, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Get an item of classes.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemClasses(Id tagId, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Push an element to classes.
   */
  function pushClasses(Id tagId, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to classes.
   */
  function _pushClasses(Id tagId, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Pop an element from classes.
   */
  function popClasses(Id tagId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Pop an element from classes.
   */
  function _popClasses(Id tagId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Update an element of classes at `_index`.
   */
  function updateClasses(Id tagId, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of classes at `_index`.
   */
  function _updateClasses(Id tagId, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get objects.
   */
  function getObjects(Id tagId) internal view returns (bytes32[] memory objects) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 1);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Get objects.
   */
  function _getObjects(Id tagId) internal view returns (bytes32[] memory objects) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 1);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Set objects.
   */
  function setObjects(Id tagId, bytes32[] memory objects) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 1, EncodeArray.encode((objects)));
  }

  /**
   * @notice Set objects.
   */
  function _setObjects(Id tagId, bytes32[] memory objects) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreCore.setDynamicField(_tableId, _keyTuple, 1, EncodeArray.encode((objects)));
  }

  /**
   * @notice Get the length of objects.
   */
  function lengthObjects(Id tagId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get the length of objects.
   */
  function _lengthObjects(Id tagId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get an item of objects.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemObjects(Id tagId, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Get an item of objects.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemObjects(Id tagId, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Push an element to objects.
   */
  function pushObjects(Id tagId, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 1, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to objects.
   */
  function _pushObjects(Id tagId, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 1, abi.encodePacked((_element)));
  }

  /**
   * @notice Pop an element from objects.
   */
  function popObjects(Id tagId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 1, 32);
  }

  /**
   * @notice Pop an element from objects.
   */
  function _popObjects(Id tagId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 1, 32);
  }

  /**
   * @notice Update an element of objects at `_index`.
   */
  function updateObjects(Id tagId, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of objects at `_index`.
   */
  function _updateObjects(Id tagId, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get the full data.
   */
  function get(Id tagId) internal view returns (SystemTagsData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(Id tagId) internal view returns (SystemTagsData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(Id tagId, bool exists, bytes32[] memory classes, bytes32[] memory objects) internal {
    bytes memory _staticData = encodeStatic(exists);

    EncodedLengths _encodedLengths = encodeLengths(classes, objects);
    bytes memory _dynamicData = encodeDynamic(classes, objects);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(Id tagId, bool exists, bytes32[] memory classes, bytes32[] memory objects) internal {
    bytes memory _staticData = encodeStatic(exists);

    EncodedLengths _encodedLengths = encodeLengths(classes, objects);
    bytes memory _dynamicData = encodeDynamic(classes, objects);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(Id tagId, SystemTagsData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.exists);

    EncodedLengths _encodedLengths = encodeLengths(_table.classes, _table.objects);
    bytes memory _dynamicData = encodeDynamic(_table.classes, _table.objects);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(Id tagId, SystemTagsData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.exists);

    EncodedLengths _encodedLengths = encodeLengths(_table.classes, _table.objects);
    bytes memory _dynamicData = encodeDynamic(_table.classes, _table.objects);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(bytes memory _blob) internal pure returns (bool exists) {
    exists = (_toBool(uint8(Bytes.getBytes1(_blob, 0))));
  }

  /**
   * @notice Decode the tightly packed blob of dynamic data using the encoded lengths.
   */
  function decodeDynamic(
    EncodedLengths _encodedLengths,
    bytes memory _blob
  ) internal pure returns (bytes32[] memory classes, bytes32[] memory objects) {
    uint256 _start;
    uint256 _end;
    unchecked {
      _end = _encodedLengths.atIndex(0);
    }
    classes = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());

    _start = _end;
    unchecked {
      _end += _encodedLengths.atIndex(1);
    }
    objects = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   * @param _encodedLengths Encoded lengths of dynamic fields.
   * @param _dynamicData Tightly packed dynamic fields.
   */
  function decode(
    bytes memory _staticData,
    EncodedLengths _encodedLengths,
    bytes memory _dynamicData
  ) internal pure returns (SystemTagsData memory _table) {
    (_table.exists) = decodeStatic(_staticData);

    (_table.classes, _table.objects) = decodeDynamic(_encodedLengths, _dynamicData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(Id tagId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(Id tagId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(bool exists) internal pure returns (bytes memory) {
    return abi.encodePacked(exists);
  }

  /**
   * @notice Tightly pack dynamic data lengths using this table's schema.
   * @return _encodedLengths The lengths of the dynamic fields (packed into a single bytes32 value).
   */
  function encodeLengths(
    bytes32[] memory classes,
    bytes32[] memory objects
  ) internal pure returns (EncodedLengths _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = EncodedLengthsLib.pack(classes.length * 32, objects.length * 32);
    }
  }

  /**
   * @notice Tightly pack dynamic (variable length) data using this table's schema.
   * @return The dynamic data, encoded into a sequence of bytes.
   */
  function encodeDynamic(bytes32[] memory classes, bytes32[] memory objects) internal pure returns (bytes memory) {
    return abi.encodePacked(EncodeArray.encode((classes)), EncodeArray.encode((objects)));
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    bool exists,
    bytes32[] memory classes,
    bytes32[] memory objects
  ) internal pure returns (bytes memory, EncodedLengths, bytes memory) {
    bytes memory _staticData = encodeStatic(exists);

    EncodedLengths _encodedLengths = encodeLengths(classes, objects);
    bytes memory _dynamicData = encodeDynamic(classes, objects);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(Id tagId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = Id.unwrap(tagId);

    return _keyTuple;
  }
}

/**
 * @notice Cast a value to a bool.
 * @dev Boolean values are encoded as uint8 (1 = true, 0 = false), but Solidity doesn't allow casting between uint8 and bool.
 * @param value The uint8 value to convert.
 * @return result The boolean value.
 */
function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}
