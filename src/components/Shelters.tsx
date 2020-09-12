import { graphql, useStaticQuery } from "gatsby"
import React from "react"

const shelterQuery = graphql`
  query shelterQuery {
    allAirtable(filter: { table: { eq: "Shelter" } }) {
      nodes {
        data {
          County {
            data {
              Name
            }
          }
          Address
          Alert_Link
          Directions
          Lat
          Log
          Name
          Phone
        }
      }
    }
  }
`

export const Shelters: React.FC = () => {
  const data = useStaticQuery<GatsbyTypes.shelterQueryQuery>(shelterQuery)
  return <div>{JSON.stringify(data.allAirtable.nodes, null, 2)}</div>
}
