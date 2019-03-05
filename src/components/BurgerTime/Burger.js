import React from "react"
import styled from "styled-components"

import Patty from "./Patty"
import RotatedPatty from "./RotatedPatty"

const Bun = styled.div`
  cursor: pointer;
`

const Burger = ({ closed, foreColor, onClick }) => (
  <Bun onClick={onClick}>
    {closed &&
      <React.Fragment>
        <Patty />
        <Patty />
        <Patty />
      </React.Fragment>
    }
    {!closed && <RotatedPatty foreColor={foreColor} />}
  </Bun>
)

export default Burger
