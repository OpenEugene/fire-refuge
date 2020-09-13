import { Link } from "gatsby"
import React from "react"
import Image from "../components/image"
import Layout from "../components/layout"
import SEO from "../components/seo"

const IndexPage = () => (
  <Layout>
    <SEO title="Home" />
    <h1>Welcome</h1>
    <p>We hope you are able to find the resources your need</p>
    <div style={{ maxWidth: `300px`, marginBottom: `1.45rem` }}>
      <Image />
    </div>
    <Link to="/resources/">Go to "resources"</Link>
    <br />
    <Link to="/mapView/">Go to "Map View"</Link>
  </Layout>
)

export default IndexPage
