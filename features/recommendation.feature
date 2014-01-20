Feature: Recommendations

  @javascript
  Scenario: Getting recommendations
    Given the seeds
    When I go to the hero picker page
    And I type Abaddon into the friendly hero select
    Then I should see Abaddon in the first box for my team
    Then I should see 5 best pick recommendations
    And I should see 5 worst pick recommendations
    And I should see needed roles
    And I should see filled roles

    When I click on the first recommendation
    Then I should see that hero on my team list

    When I click on the first member of my team
    Then that box should become blank

    When I click on the first recommendation
    And I click on the first recommendation
    And I click on the first recommendation
    Then I should see 5 ban recommendations

    When I type Bloodseeker into the enemy hero select
    Then I should see Bloodseeker on the enemy team list

    When I type Clinkz into the ban select
    Then I should see Clinkz on the ban list

    When I click on the first ban recommendation
    Then there should be another hero on the ban list
