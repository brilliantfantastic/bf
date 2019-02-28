import React from "react"
import styled from "styled-components"

const Bun = styled.div`
  cursor: pointer;
`

const Patty = styled.div`
  background-color: black;
  height: 5px;
  margin: 6px 0;
  width: 35px;
`

const Burger = () => (
  <Bun>
    <Patty />
    <Patty />
    <Patty />
  </Bun>
)

const BurgerTime = () => (
  <Burger />
)

export default BurgerTime
