/*
    Tool for deploying coins.
    - Capabilities are destroyed after the coin is created (will add a way to keep them if needed)
    - The deployer is initialized with a fee that is paid in APT
    - The deployer is initialized with an owner address that can change the fee and owner address
    - The deployer is initialized with a coins table that maps coin addresses to their addresses
    - coins can be added/removed to the map manually by the deployer owner
    - can view the coins table
*/

module bapt_framework::deployer_v2 {

    use aptos_framework::coin::{Self, BurnCapability, FreezeCapability};
    use aptos_framework::aptos_coin::AptosCoin;
    use aptos_framework::event;
    use aptos_std::type_info;
    use bapt_framework::deployer;
    use baptswap_v2dot1::fee_on_transfer_v2dot1;
    use baptswap_v2dot1::router_v2dot1;
    use std::error;
    use std::signer;
    use std::string::{String};

    // ------
    // Errors
    // ------

    /// There is not enough X supply to create the LP
    const EINSUFFICIENT_X_SUPPLY: u64 = 0;
    /// There is not enough Y supply to create the LP
    const EINSUFFICIENT_Y_SUPPLY: u64 = 1;

    /// Deploy a coin and create an LP for <CoinType, Y>
    public entry fun generate_coin_and_liquidate<CoinType, Y>(
        deployer: &signer,
        // coin specific parameters
        name: String,
        symbol: String,
        decimals: u8,
        total_supply: u64,
        // fee_on_transfer specific parameters
        liquidity_fee: u128,
        rewards_fee: u128,
        team_fee: u128,
        // LP specific parameters
        amount_x_desired: u64,
        amount_y_desired: u64,
        amount_x_min: u64,
        amount_y_min: u64
    ) {
        // assert total_supply >= amount_x_desired
        assert!(total_supply >= amount_x_desired, EINSUFFICIENT_X_SUPPLY);
        // assert balance >= amount y desired
        assert!(coin::balance<Y>(signer::address_of(deployer)) >= amount_y_desired, EINSUFFICIENT_Y_SUPPLY);
        // create coin
        deployer::generate_coin<CoinType>(
            deployer,
            name,
            symbol,
            decimals,
            total_supply,
            true   
        );
        // initialize fee_on_transfer
        fee_on_transfer_v2dot1::initialize_fee_on_transfer<CoinType>(
            deployer,
            liquidity_fee,
            rewards_fee,
            team_fee
        );
        // create pair and add liquidity
        router_v2dot1::add_liquidity<CoinType, Y>(
            deployer,
            amount_x_desired,
            amount_y_desired,
            amount_x_min,
            amount_y_min
        );
    }
        

}