Feature: As a user, I should be able to order food with different payment options

  Scenario: I should be able to order food by cash on delivery.

    Given As a user I order following items:
      | item_name     | quantity |
      | Dosa          | 1        |
      | Filter Coffee | 1        |
    Then I should see above items in cart



