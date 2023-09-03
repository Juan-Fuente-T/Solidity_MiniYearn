// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;
//importacion de ERC20, valido para usar en Remix. Es necesario haberlo descargado para ejecutar en  local.
import "https://github.com/transmissions11/solmate/blob/main/src/tokens/ERC20.sol";

//Interfaces, obtienen caracteristicas de otros contratos
interface IWrappedTokenGetway{
    //funciones para depositar y retirar en el Gateway
    function depositETH(address pool, address onBehalfOf, uint16 referralCode) external payable;
    function withdrawETH(address pool, uint256 amount, address to) external;
}

interface IAToken{
    //funciones para aprobar y obtener lo balances, normal y con los porcentajes de incremento
    function balanceOf(address user) external returns (uint256);
    function scaledBalanceOf(address user) external returns(uint256);
    function approve(address _spender, uint256 value) external returns (bool success);

}

contract MiniYearn is ERC20{ //el contrato hereda del ERC20
    
    //direcciones de los contratos, necesarias para el deploy
    IWrappedTokenGetway gateway; //WETH Gateway 0xD322A49006FC828F9B5B37Ab215F99B4E5caB19C
    address pool; //0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2
    IAToken aETH; //0x4d5F47FA6A74757f35C14fD3a6Ef8E3C9BC514E8

    //el constructor inicializa las variables con sus respectivos valores pasados por parametro
    constructor (address _pool, address _gateway, address _aETH) ERC20("MiniYearn", "MYT", 18){
        pool = _pool;
        gateway = IWrappedTokenGetway(_gateway);
        aETH = IAToken(_aETH);
    }
    //errores 
    error NoPuedeSerCero();
    error MasDeLoQueTienes();

    ///CEI: Checks, Effects, Interactions
    //funcion para depositar
    function deposit() payable external{
        //Checks: comprobar que el msg.value sea mayor que cero
        if (msg.value == 0){
            revert NoPuedeSerCero();
            //ejemplo error con require: require (msg.value > 0, "No puede ser cero");
        }
        //Efects: minterar el ERC20
        _mint(msg.sender, msg.value); //erl usuario recibe tokens Atoken al depositar

        //Interactions: hacer el deposito en AAVE a través del Gateway
        gateway.depositETH{value: msg.value}(pool, address(this), 0);
    }
    //funcion para retirar fondos
    function withdraw(uint256 amount) public payable{

        //Checks
        if (amount > balanceOf[msg.sender]){
            revert MasDeLoQueTienes(); //error si se retende retirar una cantidad mayor al balance
        }
        //Effetcs
        _burn(msg.sender, amount); //se queman los token que entrega el usuario al retirar fondos

        aETH.approve(address(gateway), amount); //se aprueba la retirada de los fondos

        //Interacts
        gateway.withdrawETH(pool, amount, msg.sender);//se entreha el eth finalmente


    }
    //funcion para obtener precio del token que recibe el usuario en relacion a la liquedez depositada
    function getPrice() public returns(uint256){
        return aETH.scaledBalanceOf(address(this)) * 10 ** 18 / totalSupply; //se obtiene el balance real de nuestras inveriones en AAVE y se divide entre la cantidad depositada en nuestro contrato

    }
    //funcion para obtener la cantidad de eth que hemos depositado en AAVE
    function getUnderlying() public returns (uint256){
        return aETH.balanceOf(address(this));//balance de nuestro contrato 
    }
}