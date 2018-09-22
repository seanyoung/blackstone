pragma solidity ^0.4.23;

import "commons-collections/VersionLinkedAppendOnly.sol";

/**
 * https://en.wikipedia.org/wiki/ISO_4217
 */
contract IsoCurrencies is VersionLinkedAppendOnly {

	struct Currency {
		bytes3 alpha3;	// 3-letter Currency code
		bytes3 num3;		// 3-digit numeric code which may match the country's M49 code
		string name;		// Currency name (EN)
    bool exists;
	}

	bytes3[] currencyKeys;
	
	mapping(bytes3 => Currency) public currencies;

	function getNumberOfCurrencies() external view returns (uint size) {
		return currencyKeys.length;
	}

	function getCurrencyAtIndex(uint _index) external view returns (bytes3) {
		return currencyKeys[_index];
	}

	function getCurrencyData(bytes3 _key) external view returns (bytes3 alpha3, bytes3 m49, string name) {
		alpha3 = currencies[_key].alpha3;
		m49 = currencies[_key].num3;
		name = currencies[_key].name;
	}

  function isCurrency(bytes3 _alpha3) external view returns (bool) {
    return currencies[_alpha3].exists;
  }
	
}
