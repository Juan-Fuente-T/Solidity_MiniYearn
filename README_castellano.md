# Contrato MiniYearn

Este es un contrato inteligente en Solidity llamado MiniYearn que interactúa con el protocolo de préstamos de AAVE. Permite a los usuarios depositar y retirar ETH, recibiendo tokens con intereses de AAVE a cambio.

## Requisitos previos

- Versión de Solidity 0.8.19
- IDE Remix para pruebas (las declaraciones de importación están configuradas para Remix). Puedes probarlo en local (necesitarás ERC20).
- Biblioteca ERC20.sol (puedes encontrarla en el repositorio de GitHub proporcionado)

## Detalles del Contrato

- Nombre del Contrato: MiniYearn
- Nombre del Token: Token MiniYearn (MYT)
- Símbolo del Token: MYT
- Decimales: 18

## Funcionalidad

- `deposit()`: Permite a los usuarios depositar ETH en el contrato y recibir tokens MYT.
- `withdraw(uint256 amount)`: Permite a los usuarios retirar una cantidad especificada de su ETH depositado entregando los tokens MYT correspondientes.
- `getPrice()`: Devuelve el precio de los tokens MYT en relación a la liquidez depositada.
- `getUnderlying()`: Devuelve la cantidad de ETH depositada en el protocolo de préstamos de AAVE.

## Despliegue

1. Despliega el contrato en un entorno de desarrollo de Ethereum compatible (por ejemplo, Remix IDE). Aconsejable usarlo en una testnet, en donde esté presente AAVE, como por ejemplo Sepolia. 
 Necesitarás las direcciones del Gateway, de la pool y del aEth Token
2. Proporciona la dirección del contrato a los usuarios que deseen interactuar con él.

## Uso

1. Los usuarios pueden depositar ETH llamando a la función `deposit()`.
2. Los usuarios pueden retirar su ETH depositado junto con los tokens MYT correspondientes llamando a la función `withdraw(uint256 amount)`.

## Descargo de Responsabilidad

Este contrato es con fines educativos y de experimentación con el protocolo de préstamos de AAVE. Úsalo bajo tu propio riesgo.

## Licencia

Este contrato es de código abierto y se publica bajo la Licencia Pública General de GNU versión 3.0. Consulta el SPDX-License-Identifier para obtener más detalles.
