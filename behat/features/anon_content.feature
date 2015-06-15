Feature: BEM Markup
  In order to be able to read content
  As an anonymous user
  We need to be able to visit a page and view the content

  @javascript @api
  Scenario: As an administrator, I should be able to add BEM Markup to the content type
    Given I am logged in as a user with the administrator role
     When I visit "admin/structure/types/manage/article"
     Then I should see "BEM Markup"
     When I click "BEM Markup"
      And I fill in "edit-bem-markup-base-class" with "behatarticle"
      And I press "Save content type"
     Then I should see "The content type Article has been updated."
     When I visit "admin/structure/types/manage/article/fields/body"
     Then I should see "BEM Class"
      And I fill in "edit-instance-bem-markup-class" with "cool-body"
      And I press "Save settings"
     Then I should see "Saved Body configuration."
     When I visit "node/add/article"
      And I fill in "edit-title" with "Test Article"
      And I fill in "edit-body-und-0-value" with "Test body content"
      And I press "Save"
     Then I should see "Article Test Article has been created."
     Then I should see a ".behatarticle" element
     Then I should see a ".behatarticle__cool-body" element

