import styled from "styled-components"

const RotatedPatty = styled.div`
  display: inline-block;
  height: 35px;
  overflow: hidden;
  position: relative;
  width: 35px;
  z-index: 10;

  &::before, &::after {
    background-color: #fff;
    content: "";
    height: 5px;
    left: 0;
    margin-top: -1px;
    position: absolute;
    top: 50%;
    width: 100%;
  }

  &::before {
    transform: rotate(45deg);
  }

  &::after {
    transform: rotate(-45deg);
  }
`

export default RotatedPatty
