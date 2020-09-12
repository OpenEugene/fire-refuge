import {
  Card,
  CardContent,
  Link,
  makeStyles,
  Theme,
  Typography,
} from "@material-ui/core"
import { graphql, useStaticQuery } from "gatsby"
import React from "react"
import SEO from "../components/seo"

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
const useStyles = makeStyles((theme: Theme) => ({
  allCards: {
    display: "grid",
    gridGap: theme.spacing(2),
    gridTemplateColumns: "repeat(auto-fill, minmax(300px, 1fr))",
  },
}))
export const Shelters: React.FC = () => {
  const classes = useStyles()
  const data = useStaticQuery<GatsbyTypes.shelterQueryQuery>(shelterQuery)
  return (
    <div>
      <Typography variant="h1">Shelters</Typography>
      <div className={classes.allCards}>
        <SEO title="Shelters" />
        {data.allAirtable.nodes.map(shelter => (
          <Card key={shelter.data?.Name}>
            <CardContent>
              <Typography variant="h5">{shelter.data?.Name}</Typography>
              <Typography>Phone: {shelter.data?.Phone}</Typography>
              <Typography>Address: {shelter.data?.Address}</Typography>
              <Link href={shelter.data?.Directions}>Directions</Link>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  )
}
