pragma solidity ^0.4.24;

import "@aragon/abis/os/contracts/apps/AragonApp.sol";
import "@aragon/apps-vault/contracts/Vault.sol";
//import "@aragon/apps-token-manager/contracts/TokenManager.sol";


contract TokenSale is AragonApp {

    bytes32 constant public SET_TOKEN_MANAGER_ROLE = keccak256("SET_TOKEN_MANAGER_ROLE");
    bytes32 constant public SET_VAULT_ROLE = keccak256("SET_VAULT_ROLE");

    //TokenManager public tokenManager;
    Vault public vault;

    //event SetTokenManager(address tokenManager);
    event SetVault(address vault);


    /**
    * @notice Initialize TokenSale contract
    */
    function initialize() external onlyInit {
        //tokenManager = TokenManager(0x3a0e04f7458e6027489f4359a0a51585e994530a);
        vault = Vault(0xae47fe99467f4c55f0c8f034970086d085564456);

        initialized();
    }

    /**
    * @notice Set the Token Manager to `_tokenManager`.
    * @param _tokenManager The new token manager address
    
    function setTokenManager(address _tokenManager) external auth(SET_TOKEN_MANAGER_ROLE) {
        require(isContract(_tokenManager), ERROR_ADDRESS_NOT_CONTRACT);

        tokenManager = TokenManager(_tokenManager);
        emit SetTokenManager(_tokenManager);
    }
    */

    /**
    * @notice Set the Vault to `_vault`.
    * @param _vault The new vault address
    */
    function setVault(address _vault) external auth(SET_VAULT_ROLE) {
        vault = _vault;
        emit SetVault(_vault);
    }

    /**
    * @dev Convenience function for getting the Minted Token in a radspec string
    */
    function getToken() public returns (address) {
        return tokenManager.token();
    }
/*
    function mint(uint256 _amount) external payable {
        tokenManager.mint(msg.sender, _amount);
    }
*/
}
