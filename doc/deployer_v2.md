
<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2"></a>

# Module `0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb::deployer_v2`



-  [Resource `Config`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_Config)
-  [Resource `Caps`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_Caps)
-  [Struct `BurnCapCreated`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_BurnCapCreated)
-  [Struct `FreezeCapCreated`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_FreezeCapCreated)
-  [Struct `DeployAndLiquidateFeeUpdated`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_DeployAndLiquidateFeeUpdated)
-  [Struct `DeployAndCreatePairFeeUpdated`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_DeployAndCreatePairFeeUpdated)
-  [Struct `AdminUpdated`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_AdminUpdated)
-  [Struct `CoinsBurned`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_CoinsBurned)
-  [Struct `CoinsFrozen`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_CoinsFrozen)
-  [Constants](#@Constants_0)
-  [Function `init`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_init)
-  [Function `generate_coin_and_liquidate`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_generate_coin_and_liquidate)
-  [Function `generate_coin_and_initialize_fee_on_transfer`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_generate_coin_and_initialize_fee_on_transfer)
-  [Function `burn`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_burn)
-  [Function `freeze_account_coinstore`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_freeze_account_coinstore)
-  [Function `admin`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_admin)
-  [Function `deploy_and_liquidate_fee`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_deploy_and_liquidate_fee)
-  [Function `deploy_and_initialize_fee_on_transfer_fee`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_deploy_and_initialize_fee_on_transfer_fee)
-  [Function `coin_owner`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_coin_owner)
-  [Function `is_burnable`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_is_burnable)
-  [Function `is_freezable`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_is_freezable)
-  [Function `get_caps`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_get_caps)
-  [Function `set_admin`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_set_admin)
-  [Function `set_deploy_and_liquidate_fee`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_set_deploy_and_liquidate_fee)
-  [Function `set_deploy_and_initialize_fee_on_transfer_fee`](#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_set_deploy_and_initialize_fee_on_transfer_fee)


<pre><code><b>use</b> <a href="">0x1::aptos_coin</a>;
<b>use</b> <a href="">0x1::coin</a>;
<b>use</b> <a href="">0x1::event</a>;
<b>use</b> <a href="">0x1::option</a>;
<b>use</b> <a href="">0x1::signer</a>;
<b>use</b> <a href="">0x1::string</a>;
<b>use</b> <a href="">0x1::type_info</a>;
<b>use</b> <a href="">0x58e119832e253f9bba2192d916e1837234d4cf32dfc7dc55615c1195ac2447cd::fee_on_transfer_v2dot1</a>;
<b>use</b> <a href="">0x58e119832e253f9bba2192d916e1837234d4cf32dfc7dc55615c1195ac2447cd::router_v2dot1</a>;
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_Config"></a>

## Resource `Config`

Global storage for the deployer config info


<pre><code><b>struct</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_Config">Config</a> <b>has</b> key
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_Caps"></a>

## Resource `Caps`

Global storage for the coins capabilities


<pre><code><b>struct</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_Caps">Caps</a>&lt;CoinType&gt; <b>has</b> key
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_BurnCapCreated"></a>

## Struct `BurnCapCreated`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_BurnCapCreated">BurnCapCreated</a> <b>has</b> drop, store
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_FreezeCapCreated"></a>

## Struct `FreezeCapCreated`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_FreezeCapCreated">FreezeCapCreated</a> <b>has</b> drop, store
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_DeployAndLiquidateFeeUpdated"></a>

## Struct `DeployAndLiquidateFeeUpdated`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_DeployAndLiquidateFeeUpdated">DeployAndLiquidateFeeUpdated</a> <b>has</b> drop, store
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_DeployAndCreatePairFeeUpdated"></a>

## Struct `DeployAndCreatePairFeeUpdated`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_DeployAndCreatePairFeeUpdated">DeployAndCreatePairFeeUpdated</a> <b>has</b> drop, store
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_AdminUpdated"></a>

## Struct `AdminUpdated`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_AdminUpdated">AdminUpdated</a> <b>has</b> drop, store
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_CoinsBurned"></a>

## Struct `CoinsBurned`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_CoinsBurned">CoinsBurned</a> <b>has</b> drop, store
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_CoinsFrozen"></a>

## Struct `CoinsFrozen`



<pre><code>#[<a href="">event</a>]
<b>struct</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_CoinsFrozen">CoinsFrozen</a> <b>has</b> drop, store
</code></pre>



<a id="@Constants_0"></a>

## Constants


<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_ECOIN_NOT_BURNABLE"></a>

The coin is not burnable


<pre><code><b>const</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_ECOIN_NOT_BURNABLE">ECOIN_NOT_BURNABLE</a>: u64 = 7;
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_ECOIN_NOT_FREEZABLE"></a>

The coin is not freezable


<pre><code><b>const</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_ECOIN_NOT_FREEZABLE">ECOIN_NOT_FREEZABLE</a>: u64 = 8;
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_EDEPLOYER_NOT_INITIALIZED"></a>

The deployer has not been initialized


<pre><code><b>const</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_EDEPLOYER_NOT_INITIALIZED">EDEPLOYER_NOT_INITIALIZED</a>: u64 = 0;
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_EINSUFFICIENT_APT_BALANCE"></a>

The signer does not have enough APT to pay the fee


<pre><code><b>const</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_EINSUFFICIENT_APT_BALANCE">EINSUFFICIENT_APT_BALANCE</a>: u64 = 4;
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_EINSUFFICIENT_X_SUPPLY"></a>

There is not enough X supply to create the LP


<pre><code><b>const</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_EINSUFFICIENT_X_SUPPLY">EINSUFFICIENT_X_SUPPLY</a>: u64 = 2;
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_EINSUFFICIENT_Y_SUPPLY"></a>

There is not enough Y supply to create the LP


<pre><code><b>const</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_EINSUFFICIENT_Y_SUPPLY">EINSUFFICIENT_Y_SUPPLY</a>: u64 = 3;
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_ENOT_BAPT_ACCOUNT"></a>

The signer is not the bapt framework


<pre><code><b>const</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_ENOT_BAPT_ACCOUNT">ENOT_BAPT_ACCOUNT</a>: u64 = 1;
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_ESAME_ADMIN"></a>

The inputted admin is the same as the old admin


<pre><code><b>const</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_ESAME_ADMIN">ESAME_ADMIN</a>: u64 = 5;
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_ESAME_FEE"></a>

The inputted fee is the same as the old fee


<pre><code><b>const</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_ESAME_FEE">ESAME_FEE</a>: u64 = 6;
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_init"></a>

## Function `init`



<pre><code>entry <b>fun</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_init">init</a>(signer_ref: &<a href="">signer</a>, deploy_and_liquidate_fee: u64, deploy_and_initialize_fee_on_transfer_fee: u64)
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_generate_coin_and_liquidate"></a>

## Function `generate_coin_and_liquidate`

Deploy a coin and create an LP for <CoinType, Y>


<pre><code><b>public</b> entry <b>fun</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_generate_coin_and_liquidate">generate_coin_and_liquidate</a>&lt;CoinType, Y&gt;(<a href="">deployer</a>: &<a href="">signer</a>, name: <a href="_String">string::String</a>, symbol: <a href="_String">string::String</a>, decimals: u8, total_supply: u64, burnable: bool, freezable: bool, liquidity_fee: u128, rewards_fee: u128, team_fee: u128, amount_x_desired: u64, amount_y_desired: u64, amount_x_min: u64, amount_y_min: u64)
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_generate_coin_and_initialize_fee_on_transfer"></a>

## Function `generate_coin_and_initialize_fee_on_transfer`

Deploy a coin and initialize fee-on-transfer for it


<pre><code><b>public</b> entry <b>fun</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_generate_coin_and_initialize_fee_on_transfer">generate_coin_and_initialize_fee_on_transfer</a>&lt;CoinType&gt;(<a href="">deployer</a>: &<a href="">signer</a>, name: <a href="_String">string::String</a>, symbol: <a href="_String">string::String</a>, decimals: u8, total_supply: u64, burnable: bool, freezable: bool, liquidity_fee: u128, rewards_fee: u128, team_fee: u128)
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_burn"></a>

## Function `burn`

Burn an amount of a CoinType


<pre><code><b>public</b> entry <b>fun</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_burn">burn</a>&lt;CoinType&gt;(signer_ref: &<a href="">signer</a>, amount: u64)
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_freeze_account_coinstore"></a>

## Function `freeze_account_coinstore`

Freeze a CoinStore in an account address of a CoinType


<pre><code><b>public</b> entry <b>fun</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_freeze_account_coinstore">freeze_account_coinstore</a>&lt;CoinType&gt;(acc_addr: <b>address</b>)
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_admin"></a>

## Function `admin`

Get the current admin


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="">admin</a>(): <b>address</b>
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_deploy_and_liquidate_fee"></a>

## Function `deploy_and_liquidate_fee`

Get the current fee for deploy and liquidate


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_deploy_and_liquidate_fee">deploy_and_liquidate_fee</a>(): u64
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_deploy_and_initialize_fee_on_transfer_fee"></a>

## Function `deploy_and_initialize_fee_on_transfer_fee`

Get the current fee for deploy and create pair


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_deploy_and_initialize_fee_on_transfer_fee">deploy_and_initialize_fee_on_transfer_fee</a>(): u64
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_coin_owner"></a>

## Function `coin_owner`

Get coin owner


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_coin_owner">coin_owner</a>&lt;CoinType&gt;(): <b>address</b>
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_is_burnable"></a>

## Function `is_burnable`

Check if a coin is burnable


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_is_burnable">is_burnable</a>&lt;CoinType&gt;(): bool
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_is_freezable"></a>

## Function `is_freezable`

Check if a coin is freezable


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_is_freezable">is_freezable</a>&lt;CoinType&gt;(): bool
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_get_caps"></a>

## Function `get_caps`

Get a vec of caps for a given coin


<pre><code>#[view]
<b>public</b> <b>fun</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_get_caps">get_caps</a>&lt;CoinType&gt;(): <a href="">vector</a>&lt;<a href="_String">string::String</a>&gt;
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_set_admin"></a>

## Function `set_admin`

Change the admin


<pre><code><b>public</b> entry <b>fun</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_set_admin">set_admin</a>(signer_ref: &<a href="">signer</a>, new_admin: <b>address</b>)
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_set_deploy_and_liquidate_fee"></a>

## Function `set_deploy_and_liquidate_fee`

Change the fee for deploy and liquidate


<pre><code><b>public</b> entry <b>fun</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_set_deploy_and_liquidate_fee">set_deploy_and_liquidate_fee</a>(signer_ref: &<a href="">signer</a>, new_fee: u64)
</code></pre>



<a id="0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_set_deploy_and_initialize_fee_on_transfer_fee"></a>

## Function `set_deploy_and_initialize_fee_on_transfer_fee`

Change the fee for deploy and create pair


<pre><code><b>public</b> entry <b>fun</b> <a href="deployer_v2.md#0xd0ec361a55b327913690b2851cec05f1e017ec6c647689cae051644f667a1ddb_deployer_v2_set_deploy_and_initialize_fee_on_transfer_fee">set_deploy_and_initialize_fee_on_transfer_fee</a>(signer_ref: &<a href="">signer</a>, new_fee: u64)
</code></pre>
