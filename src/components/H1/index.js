import React from "react"
import cn from "classnames"

const H1 = ({ children, className, ...rest }) => (
  <h1 {...rest} className={cn("font-bold font-heading text-3xl md:text-5xl lg:text-6xl", className)}>
    {children}
  </h1>
)

export default H1
