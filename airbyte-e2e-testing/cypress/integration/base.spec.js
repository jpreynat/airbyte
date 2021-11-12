describe("Error handling view", () => {
  it("Shows Version Mismatch page", () => {
    cy.intercept("/api/v1/*", {
      statusCode: 500,
      body: {
        error:
          "Version mismatch between 0.0.1-ci and 0.0.2-ci.\nPlease upgrade or reset your Airbyte Database, see more at https://docs.airbyte.io/operator-guides/upgrading-airbyte",
      },
    }).as("mockCall");

    cy.visit("/");

    cy.wait("@mockCall");

    cy.get("div")
      .contains("Version mismatch between 0.0.1-ci and 0.0.2-ci.")
      .should("exist");
  });

  it("Shows Server Unavailable page", () => {
    cy.intercept("/*", {
      statusCode: 502,
      body: "Failed to fetch",
    });
    cy.visit("/");

    cy.get("div")
      .contains("Server Error")
      .should("exist");
  });
});
