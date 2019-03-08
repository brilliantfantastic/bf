import styled from "styled-components"

const H3 = styled.h3`
  font-family: ${props => props.theme.fonts.body};
  font-weight: 400;
  margin: 0;

  ${props => props.theme.mq.tablet} {
    font-size: 1.75rem;
  }
`;

export default H3;
