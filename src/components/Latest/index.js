import React from "react"
import styled from 'styled-components'

const H3 = styled.h3`
  font-family: ${props => props.theme.fonts.heading};
  font-size: 3rem;
  font-weight: 400;
  text-align: center;
  width: 100%;
`

const LatestWrapper = styled.div`
  display: flex;
`

const Latest = () => (
  <LatestWrapper>
    <H3>The Latest</H3>
  </LatestWrapper>
)

export default Latest
